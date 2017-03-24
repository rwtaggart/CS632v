'''
CS632v Midterm
RW Taggart
2017.3.20
'''


def mod_char(c: str, shift: int):
    assert len(c) == 1 and 0 <= abs(shift) <= 25
    if not (ord('A') <= ord(c) <= ord('Z') or ord('a') <= ord(c) <= ord('z')):
        return c
    if c.isupper():
        norm = ord('A')
    else:
        norm = ord('a')
    return chr((ord(c) - norm + shift) % 26 + norm)


def encode_str(s: str):
    return ''.join([mod_char(c, 13) for c in s])


def decode_str(s: str):
    return ''.join([mod_char(c, -13) for c in s])


if __name__ == '__main__':
    testlst = ['A', 'Z', 'B', 'Y', 'a', 'z', 'n', 'm', 'b', 'y', '.', '_', '?', 'è']
    print("Testing output:")
    print(''.join([encode_str(c) for c in testlst]))
    print()

    plain = "Hey! This is cool, and you have no idea what I'm saying. Boo!"
    cypher = encode_str(plain)
    print('Encoding string \n  "{}": \n  "{}"'.format(plain, cypher))

    cypher = "Pnrfne pvcure? V zhpu cersre Pnrfne fnynq!"
    plain = decode_str(cypher)
    print('Decoding string \n  "{}": \n  "{}"'.format(cypher, plain))
