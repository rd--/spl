# bitShiftRight

- _bitShiftRight(aNumber, anInteger)_

Right shift, towards least significant:

```
>>> 16.bitShiftRight(3)
2
```

Shift 3 places to the right:

```
>>> 32.bitShiftRight(3)
4
```

Shift 7 places to the right, leaving no nonzero bits:

```
>>> 32.bitShiftRight(7)
0
```

`bitShiftRight` works with numbers of any size:

```
>>> (2L ^ 111 - 1).bitShiftRight(7)
20282409603651670423947251286015L
```

`bitShiftRight` automatically threads itself over lists:

```
>>> [1 2 4 16].bitShiftRight(2)
[0 0 1 4]
```

The operator form is `>>`.

* * *

See also: >>, bitShift, bitShiftLeft

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitShiftRight.html)

Categories: Bits, Binary
