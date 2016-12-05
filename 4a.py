with open('4-input.txt') as f:
    lines = f.readlines()

total = 0

for line in lines:
    characters = {}
    line_parts = line.split('[')
    checksum = line_parts[1].split(']')[0]
    dash_parts = line_parts[0].split('-')
    sector_id = int(dash_parts.pop())
    letters = "".join(dash_parts)
    for letter in letters:
        if not characters.get(letter, False):
            characters[letter] = {'letter': letter, 'count': 0}
        characters[letter]['count'] = characters[letter]['count'] + 1
    characters_sorted = sorted(
        characters.items(),
        key=lambda x: (-x[1]['count'], x[0])
    )
    valid_checksum = "".join([x[0] for x in characters_sorted[0:5]])
    if checksum == valid_checksum:
        total = total + sector_id

print(total)
