# bitShift

- _bitShift(n, k)_

Shift the binary digits of _n_ by _k_ places to the left.

A left shift is towards the most significant bit:

```
>>> 2.bitShift(3)
16

>>> 2b10.bitShift(3)
2b10000
```

Negative values shift right, towards least significant:

```
>>> 16.bitShift(-3)
2

>>> 2b10000.bitShift(-3)
2b10
```

* * *

See also: Binary, <<, >>, bitShiftLeft, bitShiftRight

Guides: Bitwise Functions

References:
_Smalltalk_
5.6.5.8

Categories: Bits, Binary
