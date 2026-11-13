import json
from pathlib import Path
import re
import unittest

from tools.build_api import ROOT, extract, outputs


class ReferenceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.catalog = extract()
        cls.entries = {e['name']: e for e in cls.catalog['entries']}

    def test_original_duplicate_preserved(self):
        self.assertEqual((ROOT / 'DespairEngine_API_FEAR3').read_bytes(),
                         (ROOT / 'luasense_decompiled.lua').read_bytes())

    def test_source_coverage(self):
        self.assertEqual(self.catalog['statistics'], {
            'root_instructions': 52603, 'child_prototypes': 3025,
            'stub_functions': 1503, 'calltip_records': 3002,
            'catalog_entries': 3879, 'unresolved_constant_keys': 242})

    def test_original_developer_text(self):
        entry = self.entries['GameScript.Game.Player.SetCrouch']
        self.assertEqual(len(entry['signature']['parameters']), 2)
        self.assertEqual(entry['calltip']['@K[202]'][2.0]['@K[211]'],
                         'Unused.  Somebody please delete me.')

    def test_no_guessed_editor_signature(self):
        entry = self.entries['Despair.Forge.File.SaveAs']
        self.assertIsNone(entry['signature'])
        self.assertIsInstance(entry['calltip'], dict)

    def test_aliases_not_silently_merged(self):
        self.assertIn('Player.SetCrouch', self.entries)
        self.assertIsNone(self.entries['Player.SetCrouch']['calltip'])

    def test_generated_files_are_current(self):
        for path, content in outputs(self.catalog).items():
            with self.subTest(path=path):
                self.assertEqual((ROOT / path).read_text(), content)

    def test_json_roundtrip(self):
        stored = json.loads((ROOT / 'api/despair-api.json').read_text())
        self.assertEqual(len(stored['entries']), len(self.entries))
        self.assertEqual(stored['sources'], self.catalog['sources'])

    def test_document_links_resolve(self):
        files = [ROOT / 'README.md', ROOT / 'CONTRIBUTING.md',
                 *ROOT.glob('docs/**/*.md')]
        for file in files:
            for link in re.findall(r'\]\(([^)]+)\)', file.read_text()):
                target = link.split('#')[0]
                if target and not re.match(r'\w+://', target):
                    with self.subTest(file=file, link=link):
                        self.assertTrue((file.parent / target).exists())


if __name__ == '__main__':
    unittest.main()
