import re

with open('references.bib', 'r', encoding='utf-8', errors='ignore') as f:
    text = f.read()

text = re.sub(r'author\s*=\s*\{[^}]*?牟永光\}', 'author = {裴正林 and 牟永光}', text)
text = re.sub(r'author\s*=\s*\{[^}]*?赵强\}', 'author = {龚文惠 and 赵强}', text)
text = re.sub(r'author\s*=\s*\{[^}]*?建设[^}]*?敬宇\}', 'author = {彭建设 and 张敬宇}', text)

with open('references.bib', 'w', encoding='utf-8') as f:
    f.write(text)

print('Executed fix.py')
