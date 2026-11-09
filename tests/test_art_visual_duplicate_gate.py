#!/usr/bin/env python3
"""Smoke tests for perceptual near-duplicate art gate (Pillow required)."""
import sys
import tempfile
import unittest
from pathlib import Path
from PIL import Image, ImageDraw

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
import art_visual_duplicate_gate as gate


class VisualDuplicateGateTests(unittest.TestCase):
    def test_scaled_copy_is_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            src, resized = root / 'a.png', root / 'b.png'
            im = Image.new('RGBA', (100, 100), (0, 0, 0, 0))
            draw = ImageDraw.Draw(im)
            draw.ellipse((10, 12, 90, 85), fill=(134, 100, 30, 255))
            draw.line((20, 60, 70, 25), fill='black', width=7)
            im.save(src)
            im.resize((200, 200), Image.Resampling.LANCZOS).save(resized)
            self.assertTrue(gate.near_duplicate(gate.signatures(src), gate.signatures(resized)))

    def test_different_silhouettes_are_distinct(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            src, other = root / 'a.png', root / 'b.png'
            a = Image.new('RGBA', (100, 100), (0, 0, 0, 0))
            ImageDraw.Draw(a).ellipse((15, 15, 85, 85), fill='red')
            a.save(src)
            b = Image.new('RGBA', (100, 100), (0, 0, 0, 0))
            ImageDraw.Draw(b).rectangle((12, 12, 32, 92), fill='blue')
            b.save(other)
            self.assertFalse(gate.near_duplicate(gate.signatures(src), gate.signatures(other)))

    def test_empty_alpha_is_invalid(self):
        with tempfile.TemporaryDirectory() as tmp:
            img = Path(tmp) / 'empty.png'
            Image.new('RGBA', (60, 60), (0, 0, 0, 0)).save(img)
            with self.assertRaises(ValueError):
                gate.signatures(img)


if __name__ == '__main__':
    unittest.main()
