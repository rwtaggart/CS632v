from unittest import TestCase
from .caesar_cypher import mod_char


class TestMod_char(TestCase):
    def setUp(self):
        self.test_codes = {
            'a': 'n',
            'b': 'o',
            'm': 'z',
            'n': 'a',
            'y': 'l',
            'z': 'm',
            'A': 'N',
            'B': 'O',
            'M': 'Z',
            'N': 'A',
            'Y': 'L',
            'Z': 'M',
            '.': '.',
            '?': '?',
            '_': '_',
            'è': 'è'
        }

    def test_mod_char(self):
        for c in sorted(self.test_codes):
            with self.subTest("encoding '{}'...".format(c)):
                self.assertEqual(mod_char(c, 13), self.test_codes[c])
            with self.subTest("decoding '{}'...".format(c)):
                self.assertEqual(mod_char(c, -13), self.test_codes[c])
