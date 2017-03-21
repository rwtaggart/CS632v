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
    test1 = 'this is a thing!'

    print("Thing.")

