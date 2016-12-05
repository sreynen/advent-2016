with open('4-input.txt') as f:
    lines = f.readlines()

total = 0

for line in lines:
    characters = {}
    line_parts = line.split('[')
    checksum = line_parts[1].split(']')[0]
    dash_parts = line_parts[0].split('-')
    sector_id = int(dash_parts.pop())
    shift = sector_id % 26
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
        ord_values = [ord(x) + shift for x in letters]
        for key, value in enumerate(ord_values):
            if value > 122:
                ord_values[key] = ord_values[key] - 26
        if "".join([chr(x) for x in ord_values]) == 'northpoleobjectstorage':
            print(sector_id)
