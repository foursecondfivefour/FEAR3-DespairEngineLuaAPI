import hashlib
import json
from pathlib import Path
import unittest

from tools.lua51_chunk import Chunk

ROOT = Path(__file__).resolve().parents[1]


def fixture():
    c = Chunk.__new__(Chunk)
    c.header = bytes.fromhex('1b4c75615100010404040800')
    c.size_t = 4
    c.int_size = c.ins_size = 4
    c.num_size = 8
    c.order = 'little'
    c.root = {'source': b'@fixture.lua\0', 'lines': bytes(8),
              'flags': bytes([0, 0, 2, 2]), 'code': bytes.fromhex('1e008000'),
              'constants': [(0, b''), (1, b'\x01'), (3, bytes(8)), (4, b'a\0b\0')],
              'children': [], 'lineinfo': bytes(4),
              'locals': [(b'x\0', bytes(8))], 'upvalues': [b'outer\0']}
    return c


class ChunkTests(unittest.TestCase):
    def test_lossless_roundtrip(self):
        raw = fixture().encode()
        self.assertEqual(Chunk(raw).encode(), raw)

    def test_size_t_conversion_preserves_every_field(self):
        original = Chunk(fixture().encode())
        converted = Chunk(original.encode(8))
        self.assertEqual(converted.size_t, 8)
        self.assertEqual(original.root, converted.root)
        self.assertEqual(converted.encode(4), original.encode())

    def test_nested_prototypes_survive_portable_conversion(self):
        parent = fixture()
        parent.root['children'] = [fixture().root]
        parsed = Chunk(parent.encode())
        self.assertEqual(parsed.root, Chunk(parsed.encode(8)).root)
        self.assertEqual(parsed.statistics()['prototypes'], 2)

    def test_resources_sources_match_validation_manifest(self):
        base = ROOT / 'recovered/resources'
        manifest = json.loads((base / 'manifest.json').read_text())
        self.assertTrue(manifest['requested_tool_executed'])
        self.assertEqual(manifest['summary'], {'files': 228, 'syntax_ok': 228,
            'executable_tree_exact': 228, 'with_diagnostic_markers': 0})
        self.assertEqual(len(list(base.rglob('*.lua'))), 228)
        for entry in manifest['files']:
            with self.subTest(path=entry['path']):
                self.assertTrue(entry['executable_tree_exact'])
                self.assertTrue(entry['syntax_ok'])
                self.assertEqual(hashlib.sha256((base / entry['path']).read_bytes()).hexdigest(),
                                 entry['recovered_sha256'])
                for label in ('dec', 'annotated', 'dis', 'ssa'):
                    self.assertEqual(entry['clua_' + label + '_exit_code'], 0)
                candidates = {c['mode']: c for c in entry['candidates']}
                self.assertIn('clua-dec', candidates)
                self.assertIn('clua-annotated', candidates)
                self.assertTrue(candidates[entry['selected_mode']]['executable_tree_exact'])

    def test_truncation_rejected(self):
        with self.assertRaises(ValueError):
            Chunk(fixture().encode()[:-1])

    def test_trailing_bytes_rejected(self):
        with self.assertRaises(ValueError):
            Chunk(fixture().encode() + b'x')

    def test_wrong_version_rejected(self):
        raw = bytearray(fixture().encode())
        raw[4] = 0x54
        with self.assertRaises(ValueError):
            Chunk(bytes(raw))

    def test_recovered_sources_match_validation_manifest(self):
        base = ROOT / 'recovered/boot'
        manifest = json.loads((base / 'manifest.json').read_text())
        self.assertEqual(manifest['summary']['files'], 43)
        self.assertEqual(manifest['summary']['executable_tree_exact'], 43)
        self.assertFalse(manifest['requested_tool_executed'])
        for entry in manifest['files']:
            with self.subTest(path=entry['path']):
                self.assertTrue(entry['syntax_ok'])
                self.assertTrue(entry['executable_tree_exact'])
                self.assertEqual(entry['diagnostic_markers'], 0)
                self.assertEqual(hashlib.sha256((base / entry['path']).read_bytes()).hexdigest(),
                                 entry['recovered_sha256'])


if __name__ == '__main__':
    unittest.main()
