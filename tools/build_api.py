#!/usr/bin/env python3
"""Build a reference from the preserved text artifacts; never execute Lua."""
import argparse
import ast
from collections import defaultdict
import hashlib
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
SOURCES = ('DespairEngine_API_FEAR3', 'luasense_decompiled.lua', 'luasense_bytecode_disassembly.txt')


def extract(root=ROOT):
    text = (root / SOURCES[2]).read_text()
    code, children = text.split('CHILD PROTOTYPES\n')
    constants = {}
    instructions = []
    for line_number, line in enumerate(code.splitlines(), 1):
        match = re.match(r'^(\d+)\s+(\w+)\s+(.+)$', line)
        if not match:
            continue
        pc, op, operands = match.groups()
        fields = dict(re.findall(r'(A|Bx|B|C)=(K\[\d+\]|R\d+|\d+)', operands))
        if op in ('LOADK', 'GETGLOBAL', 'SETGLOBAL'):
            value = ast.literal_eval(operands.split(' ; ', 1)[1])
            index = int(fields['Bx'])
            if index in constants and constants[index] != value:
                raise ValueError(f'Conflicting constant {index}')
            constants[index] = value
        instructions.append((int(pc), op, fields, line_number))
    # Missing constant names remain explicit symbolic keys, not guessed names.
    def key(index):
        return constants.get(int(index), f'@K[{index}]')
    registers, globals_ = {}, {}
    closures = set()
    for pc, op, f, line in instructions:
        a = int(f['A'])
        def operand(value):
            if value.startswith('K['):
                return key(value[2:-1])
            if value.startswith('R'):
                return registers[int(value[1:])]
            raise ValueError(value)
        if op == 'NEWTABLE':
            registers[a] = {}
        elif op == 'LOADK':
            registers[a] = key(f['Bx'])
        elif op == 'GETGLOBAL':
            registers[a] = globals_.setdefault(key(f['Bx']), {})
        elif op == 'SETGLOBAL':
            globals_[key(f['Bx'])] = registers[a]
        elif op == 'GETTABLE':
            registers[a] = operand(f['B'])[operand(f['C'])]
        elif op == 'SETTABLE':
            registers[a][operand(f['B'])] = operand(f['C'])
        elif op == 'CLOSURE':
            child = int(f['Bx'])
            closures.add(child)
            registers[a] = ('closure', child)
        elif op != 'RETURN':
            raise ValueError(f'Unsupported instruction {op} at {pc}')
    prototypes = re.findall(r'child#(\d+): (\d+) params, (\d+) instruction', children)
    assert closures == {int(p[0]) for p in prototypes}
    signatures = {}
    for line_number, line in enumerate((root / SOURCES[1]).read_text().splitlines(), 1):
        match = re.fullmatch(r'function ([\w.]+)\((.*?)\) end', line)
        if match:
            name, args = match.groups()
            signatures[name] = {'parameters': args.split(', ') if args else [], 'line': line_number}
    # The only Editor child table contains string-keyed call-tip records.
    tables = [v for v in globals_['Editor'].values() if isinstance(v, dict)]
    assert len(tables) == 1
    records = tables[0]
    entries = []
    for name in sorted(set(records) | set(signatures)):
        raw = records.get(name)
        entry = {'name': name, 'namespace': name.rpartition('.')[0] or '_global',
                 'signature': signatures.get(name), 'calltip': raw}
        entries.append(entry)
    return {'schema_version': 1, 'sources': {p: hashlib.sha256((root / p).read_bytes()).hexdigest() for p in SOURCES},
            'statistics': {'root_instructions': len(instructions), 'child_prototypes': len(prototypes),
                           'stub_functions': len(signatures), 'calltip_records': len(records),
                           'catalog_entries': len(entries), 'unresolved_constant_keys': len(set(re.findall(r'K\[(\d+)\]', code)) - {str(k) for k in constants})},
            'entries': entries}


def escaped(value):
    return str(value).replace('|', '\\|').replace('\r', '').replace('\n', '<br>')


def outputs(catalog):
    result = {'api/despair-api.json': json.dumps(catalog, ensure_ascii=False, indent=2) + '\n'}
    groups = defaultdict(list)
    for entry in catalog['entries']:
        groups[entry['namespace']].append(entry)
    index = ['# Lua API Despair Engine', '', 'Сгенерировано из сохранённых артефактов. Не является реализацией движка.', '',
             'Сигнатуры берутся только из Lua-заглушек. `@K[n]` — имя константы, отсутствующее в дампе.',
             'Структура call-tip сохранена без подстановки предполагаемых типов и имён полей.', '',
             '| Пространство имён | Записей |', '| --- | ---: |']
    for namespace, entries in sorted(groups.items()):
        filename = namespace + '.md'
        index.append(f'| [{namespace}](reference/{filename}) | {len(entries)} |')
        lines = [f'# {namespace}', '', '[Индекс](../API.md)', '']
        for e in entries:
            lines += [f"## {e['name']}", '']
            if e['signature'] is not None:
                sig = e['signature']
                lines += ['```lua', f"{e['name']}({', '.join(sig['parameters'])})", '```', '',
                          f"Источник: [Lua, строка {sig['line']}](../../luasense_decompiled.lua#L{sig['line']}). Имена `argN` — placeholders реконструкции.", '']
            else:
                lines += ['Сигнатура не восстановлена: записи нет в Lua-заглушках.', '']
            if e['calltip'] is not None:
                raw = e['calltip']
                if '@K[203]' in raw:
                    lines += [raw['@K[203]'], '']
                params = raw.get('@K[202]', {})
                if params:
                    lines += ['Поля параметров call-tip (интерпретация структуры, не восстановленные типы):', '',
                              '| № | Имя (`@K[209]`) | Описание (`@K[211]`) |', '| --- | --- | --- |']
                    for number, param in sorted(params.items(), key=lambda pair: float(pair[0])):
                        lines.append(f"| {number} | {escaped(param.get('@K[209]', ''))} | {escaped(param.get('@K[211]', ''))} |")
                    lines.append('')
                lines += ['<details><summary>Исходная структура call-tip</summary>', '', '```json',
                          json.dumps(raw, ensure_ascii=False, indent=2), '```', '', '</details>', '']
            else:
                lines += ['Отдельная call-tip запись для этого пути не найдена; описание алиаса автоматически не присваивается.', '']
        result[f'docs/reference/{filename}'] = '\n'.join(lines)
    result['docs/API.md'] = '\n'.join(index) + '\n'
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true', help='Fail if generated files differ')
    args = parser.parse_args()
    catalog = extract()
    stale = []
    for path, content in outputs(catalog).items():
        target = ROOT / path
        if args.check:
            if not target.exists() or target.read_text() != content:
                stale.append(path)
        else:
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(content)
    if stale:
        parser.exit(1, 'Out-of-date generated files: ' + ', '.join(stale) + '\n')
    print(json.dumps(catalog['statistics'], indent=2))


if __name__ == '__main__':
    main()
