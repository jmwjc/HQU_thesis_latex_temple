import re

with open('Introduction.tex', 'r', encoding='utf-8') as f:
    text = f.read()

blocks = [
    'antiaNumerical',
    'baileyMethodRitz',
    'antoniettiCVEMDG',
    'badiaSpaceTime'
]

for b in blocks:
    text = re.sub(r'\\cite\{[^}]*' + b + r'[^}]*\}', '', text, flags=re.DOTALL)

with open('Introduction.tex', 'w', encoding='utf-8') as f:
    f.write(text)

print('Done stripping citations!')
