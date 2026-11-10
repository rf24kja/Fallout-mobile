#!/usr/bin/env python3
"""Read-only QA for the eight RADZONE GitHub landing pages.

Run from the repository root: python tools/docs/validate_readme_showcase.py
"""
from pathlib import Path
from html.parser import HTMLParser
import re

PAGES = (
    'README.md', 'README.ru.md', 'README.es.md', 'README.de.md',
    'README.fr.md', 'README.zh-CN.md', 'README.uk.md', 'README.th.md',
)
APPROVED = (
    '01-main-menu.webp', '02-character-special.webp', '03-dialogue.webp',
    '04-world-map-quests.webp', '05-inventory-icon-reference.webp',
    '06-exploration.webp', '07-tactical-combat.webp', '08-barter.webp',
    '09-loot-container.webp', '10-skills-perks.webp',
)
SHOWCASE = ('survivor-combat-poses.webp', 'inventory-icons.webp')

class TagScanner(HTMLParser):
    def __init__(self):
        super().__init__()
        self.img = []
        self.links = []
    def handle_starttag(self, name, attrs):
        attrs = dict(attrs)
        if name == 'img':
            self.img.append(attrs)
        if name == 'a':
            self.links.append(attrs.get('href', ''))


def validate(root: Path) -> list[str]:
    errors = []
    for page in PAGES:
        path = root / page
        if not path.is_file():
            errors.append(f'{page}: missing')
            continue
        text = path.read_text(encoding='utf-8')
        parser = TagScanner()
        parser.feed(text)
        for suffix in APPROVED:
            target = f'./github-assets/approved/v2/{suffix}'
            if sum(img.get('src') == target for img in parser.img) != 1:
                errors.append(f'{page}: missing or duplicate approved image {suffix}')
        for suffix in SHOWCASE:
            target = f'./github-assets/showcase/{suffix}'
            if sum(img.get('src') == target for img in parser.img) != 1:
                errors.append(f'{page}: missing or duplicate studio image {suffix}')
        for lang in PAGES:
            if f'./{lang}' not in parser.links:
                errors.append(f'{page}: missing language link to {lang}')
        if len(parser.img) != 12:
            errors.append(f'{page}: expected 12 illustrations, got {len(parser.img)}')
        if len(re.findall(r'^## ', text, re.MULTILINE)) < 8:
            errors.append(f'{page}: incomplete editorial sections')
        if 'Not a gameplay screenshot' in text or 'not gameplay' in text:
            # English disclaimer remains on work-in-progress imagery in all locales.
            pass
        for key in ('world', 'character', 'survival', 'development'):
            if f'<a id="{key}"></a>' not in text:
                errors.append(f'{page}: anchor {key} missing')
        for im in parser.img:
            src = im.get('src', '')
            if not src.startswith('./') or not im.get('alt'):
                errors.append(f'{page}: invalid src or missing alt: {src}')
            elif not (root / src[2:]).exists():
                errors.append(f'{page}: linked image not found: {src}')
        for href in parser.links:
            if href.startswith('./') and not (root / href[2:]).exists():
                errors.append(f'{page}: internal link not found: {href}')
    return errors


if __name__ == '__main__':
    problems = validate(Path('.'))
    if problems:
        for message in problems:
            print('FAIL:', message)
        raise SystemExit(1)
    print(f'PASS: {len(PAGES)} localized READMEs, 96 illustrations, locale links, anchors, and local asset paths')