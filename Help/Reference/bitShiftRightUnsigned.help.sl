# bitShiftRightUnsigned

- _bitShiftRightUnsigned(n, k)_

Implement unsigned right shift of _n_ by _k_ places.
The operator form is `>>>`.

```
>>> -5L >> 2L
-2L

>>> -5.0 >>> 2.0
1073741822.0
```

Show in binary notation:

```
>>> -2b0101.L >> 2L
-2b0010.L

>>> -2b101.F >>> 2.0
2b00111111111111111111111111111110
```

* * *

See also: <<, >>, bitShiftLeft, bitShiftRight

Guides: Bitwise Functions

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/ecmascript-language-expressions.html#sec-unsigned-right-shift-operator)
