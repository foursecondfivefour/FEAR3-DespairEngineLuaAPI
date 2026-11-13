#!/usr/bin/env python3
"""Recover archived Lua 5.1 chunks without executing game scripts.

Usage: python tools/recover_boot.py script.zip --work-dir /path/recovery
  --luadec /path/luadec --luac /path/luac [--clua /path/cLuaDecompiler]
External tool binaries and original chunks are deliberately not stored in Git.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import zipfile

try:
    from .lua51_chunk import Chunk
except ImportError:
    from lua51_chunk import Chunk


def run(command, timeout=45):
    try:
        p = subprocess.run(list(map(str, command)), capture_output=True, timeout=timeout)
        return {'returncode': p.returncode, 'stdout': p.stdout.decode('utf-8', 'replace'),
                'stderr': p.stderr.decode('utf-8', 'replace')}
    except subprocess.TimeoutExpired:
        return {'returncode': None, 'stdout': '', 'stderr': f'Timeout after {timeout}s'}


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('archive', type=Path)
    ap.add_argument('--work-dir', required=True, type=Path)
    ap.add_argument('--luadec', required=True, type=Path)
    ap.add_argument('--luac', required=True, type=Path)
    ap.add_argument('--clua', type=Path)
    ap.add_argument('--java', type=Path)
    ap.add_argument('--unluac', type=Path)
    args = ap.parse_args()
    work = args.work_dir.resolve()
    if work.exists() and any(work.iterdir()):
        ap.error('--work-dir must be empty to avoid mixing results from different runs')
    work.mkdir(parents=True, exist_ok=True)
    source = work / 'input'
    source.mkdir(exist_ok=True)
    with zipfile.ZipFile(args.archive) as archive:
        for info in archive.infolist():
            if not (source / info.filename).resolve().is_relative_to(source):
                raise ValueError(f'Unsafe ZIP path: {info.filename}')
            if (info.external_attr >> 16) & 0o170000 == 0o120000:
                raise ValueError(f'Symlink in ZIP: {info.filename}')
        if sum(i.file_size for i in archive.infolist()) > 100_000_000:
            raise ValueError('Archive exceeds 100 MB uncompressed limit')
        archive.extractall(source)
    manifest = {'archive_sha256': hashlib.sha256(args.archive.read_bytes()).hexdigest(),
                'requested_tool_executed': bool(args.clua),
                'warning': 'Recovered source is not original source. Syntax checks do not prove semantic equivalence.',
                'files': []}
    for original in sorted(source.rglob('*.lua')):
        rel = original.relative_to(source)
        raw = original.read_bytes()
        chunk = Chunk(raw)
        assert chunk.encode() == raw, f'Non-lossless read: {rel}'
        portable = work / 'portable' / rel
        portable.parent.mkdir(parents=True, exist_ok=True)
        portable.write_bytes(chunk.encode(8))
        assert Chunk(portable.read_bytes()).root == chunk.root
        record = {'path': rel.as_posix(), 'sha256': hashlib.sha256(raw).hexdigest(),
                  'header_hex': raw[:12].hex(), **chunk.statistics(), 'candidates': []}
        logdir = work / 'diagnostics' / rel.parent / rel.stem
        logdir.mkdir(parents=True, exist_ok=True)
        for label, flags in [('default', []), ('no-guess', ['-dg']), ('all-locals', ['-a'])]:
            result = run([args.luadec, *flags, portable])
            candidate = logdir / f'{label}.lua'
            candidate.write_text(result['stdout'])
            (logdir / f'{label}.stderr.txt').write_text(result['stderr'])
            validation = run([args.luac, '-p', candidate])
            markers = len(re.findall(r'DECOMPILER ERROR|DECOMPILER WARNING', result['stdout'], re.I))
            syntax_ok = result['returncode'] == 0 and bool(result['stdout'].strip()) and validation['returncode'] == 0
            record['candidates'].append({'mode': label, 'exit_code': result['returncode'],
                                         'syntax_ok': syntax_ok, 'diagnostic_markers': markers,
                                         'syntax_error': validation['stderr']})
        if args.unluac:
            if not args.java:
                ap.error('--unluac requires --java')
            for label, flags in [('unluac', []), ('unluac-nodebug', ['--nodebug'])]:
                result = run([args.java, '-jar', args.unluac, *flags, original])
                candidate = logdir / f'{label}.lua'
                candidate.write_text(result['stdout'])
                (logdir / f'{label}.stderr.txt').write_text(result['stderr'])
                validation = run([args.luac, '-p', candidate])
                record['candidates'].append({'mode': label, 'exit_code': result['returncode'],
                    'syntax_ok': result['returncode'] == 0 and bool(result['stdout'].strip()) and validation['returncode'] == 0,
                    'diagnostic_markers': len(re.findall(r'DECOMPILER ERROR|DECOMPILER WARNING', result['stdout'], re.I)),
                    'syntax_error': validation['stderr']})
        if args.clua:
            for label, flags in [('dec', ['--dec']), ('annotated', ['--dec', '--annotate', '--debug']),
                                 ('dis', ['--dis']), ('ssa', ['--ssa-dump'])]:
                result = run([args.clua, *flags, original])
                (logdir / f'clua-{label}.txt').write_text(result['stdout'])
                (logdir / f'clua-{label}.stderr.txt').write_text(result['stderr'])
                record['clua_' + label + '_exit_code'] = result['returncode']
                if label in ('dec', 'annotated'):
                    candidate = logdir / f'clua-{label}.lua'
                    candidate.write_text(result['stdout'])
                    validation = run([args.luac, '-p', candidate])
                    record['candidates'].append({'mode': 'clua-' + label, 'exit_code': result['returncode'],
                        'syntax_ok': result['returncode'] == 0 and bool(result['stdout'].strip()) and validation['returncode'] == 0,
                        'diagnostic_markers': len(re.findall(r'DECOMPILER ERROR|DECOMPILER WARNING', result['stdout'], re.I)),
                        'syntax_error': validation['stderr']})
        def executable(p):
            return (p['flags'], p['code'], p['constants'], [executable(c) for c in p['children']])
        for candidate in record['candidates']:
            candidate['executable_tree_exact'] = False
            if candidate['syntax_ok']:
                compiled = logdir / (candidate['mode'] + '.luac')
                result = run([args.luac, '-o', compiled, logdir / (candidate['mode'] + '.lua')])
                if result['returncode'] == 0:
                    candidate['executable_tree_exact'] = executable(Chunk(compiled.read_bytes()).root) == executable(chunk.root)
        ranked = sorted(enumerate(record['candidates']),
                        key=lambda x: (not x[1]['syntax_ok'], not x[1]['executable_tree_exact'],
                                       x[1]['diagnostic_markers'], not x[1]['mode'].startswith('unluac'), x[0]))
        selected = ranked[0][1]
        record['selected_mode'] = selected['mode']
        record['syntax_ok'] = selected['syntax_ok']
        record['executable_tree_exact'] = selected['executable_tree_exact']
        record['diagnostic_markers'] = selected['diagnostic_markers']
        # Failed candidates are never presented as usable recovered source.
        destination = work / ('recovered' if record['syntax_ok'] else 'needs-repair') / rel
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(logdir / f"{selected['mode']}.lua", destination)
        record['recovered_sha256'] = hashlib.sha256(destination.read_bytes()).hexdigest()
        for label, flags in [('disassembly', ['-dis']), ('functions', ['-pn']), ('comparison', ['-fc'])]:
            result = run([args.luadec, *flags, portable])
            (logdir / f'{label}.txt').write_text(result['stdout'])
            (logdir / f'{label}.stderr.txt').write_text(result['stderr'])
            record[label + '_exit_code'] = result['returncode']
            if label == 'comparison':
                record['default_comparison_passes'] = result['stdout'].count('function check pass')
                record['default_comparison_failures'] = result['stdout'].count('function check fail')
        manifest['files'].append(record)
        print(f"{rel}: {selected['mode']}, syntax={record['syntax_ok']}, markers={record['diagnostic_markers']}", flush=True)
    manifest['summary'] = {'files': len(manifest['files']),
                           'syntax_ok': sum(f['syntax_ok'] for f in manifest['files']),
                           'executable_tree_exact': sum(f['executable_tree_exact'] for f in manifest['files']),
                           'with_diagnostic_markers': sum(bool(f['diagnostic_markers']) for f in manifest['files'])}
    (work / 'manifest.json').write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps(manifest['summary']))


if __name__ == '__main__':
    main()
