import glob, re

cited_keys = set()
for aux_file in glob.glob('*.aux'):
    try:
        with open(aux_file, 'r', encoding='utf-8') as f:
            cited = re.findall(r'\\citation\{([^}]+)\}', f.read())
            for c in cited:
                for k in c.split(','):
                    cited_keys.add(k.strip())
    except Exception as e:
        print(e)
print(f'Total cited keys: {len(cited_keys)}')
