# bitShiftLeft

- _bitShiftLeft(aNumber, anInteger)_

Left shift, towards most significant:

```
>>> 16.bitShiftLeft(3)
128
```

Shift 3 places to the left:

```
>>> 32.bitShiftLeft(3)
256
```

Shift 7 places to the left:

```
>>> 32.bitShiftLeft(7)
4096
```

`bitShiftLeft` works with numbers of any size:

```
>>> (2L ^ 100 - 1).bitShiftLeft(7)
162259276829213363391578010288000L
```

`bitShiftLeft` automatically threads itself over lists:

```
>>> [1 2 4 16].bitShiftLeft(2)
[4 8 16 64]
```

The operator form is `<<`:

```
>>> 32 << 7
4096
```

* * *

See also: <<, bitShift, bitShiftRight

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitShiftLeft.html)

Categories: Bits, Binary
