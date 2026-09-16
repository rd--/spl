# bitRotateLeft

- _bitRotateLeft(n, r, k)_

Rotate the bits of the integer _n_ by _r_ places to the left given the word size _k_.

Bit rotate left, _k=8_:

```
>>> 2r11000110
>>> .bitRotateLeft(1, 8)
2r10001101

>>> 2r10001101
>>> .bitRotateRight(1, 8)
2r11000110

>>> 2r11000110
>>> .bitRotateLeft(3, 8)
2r00110110

>>> 2r00110110
>>> .bitRotateRight(3, 8)
2r11000110
```

Bit rotate left, _k=12_:

```
>>> 2r110001100000
>>> .bitRotateLeft(1, 12)
2r100011000001

>>> 2r100011000001
>>> .bitRotateRight(1, 12)
2r110001100000
```

Bit rotate right, _k=8_:

```
>>> 2r11000110
>>> .bitRotateRight(1, 8)
2r01100011

>>> 2r11000110
>>> .bitRotateRight(3, 8)
2r11011000
```

* * *

See also: bitAnd, bitRotateRight, bitShiftLeft, bitShiftRight

Guides: Bitwise Functions
