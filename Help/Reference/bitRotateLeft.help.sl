# bitRotateLeft

- _bitRotateLeft(n, r, k)_

Rotate the bits of the integer _n_ by _r_ places to the left given the word size _k_.

Bit rotate left, _k=8_:

```
>>> 2b11000110
>>> .bitRotateLeft(1, 8)
2b10001101

>>> 2b10001101
>>> .bitRotateRight(1, 8)
2b11000110

>>> 2b11000110
>>> .bitRotateLeft(3, 8)
2b00110110

>>> 2b00110110
>>> .bitRotateRight(3, 8)
2b11000110
```

Bit rotate left, _k=12_:

```
>>> 2b110001100000
>>> .bitRotateLeft(1, 12)
2b100011000001

>>> 2b100011000001
>>> .bitRotateRight(1, 12)
2b110001100000
```

Bit rotate right, _k=8_:

```
>>> 2b11000110
>>> .bitRotateRight(1, 8)
2b01100011

>>> 2b11000110
>>> .bitRotateRight(3, 8)
2b11011000
```

* * *

See also: bitAnd, bitRotateRight, bitShiftLeft, bitShiftRight

Guides: Bitwise Functions
