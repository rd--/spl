# signedInteger

- _signedInteger(n, k)_

`signedInteger` answers _n_ constrained to be an _k_-bit signed integer,
represented using two’s-complement notation.

```
>>> 25L.signedInteger(4)
-7

>>> (2r11001, 2r0110 + 1 * -1)
(25, -7)

>>> 2L ^ 63 - 1
9223372036854775807L

>>> (2L ^ 63 - 1).signedInteger(64)
9223372036854775807L

>>> (2L ^ 63).signedInteger(64)
-9223372036854775808L

>>> (2L ^ 63 * -2).signedInteger(64)
0
```

`unsignedInteger` answers _n_ constrained to be an _k_-bit unsigned integer:

```
>>> 25L.unsignedInteger(4)
9

>>> (2r11001, 2r01001)
(25, 9)

>>> 2L ^ 64 - 1
18446744073709551615L

>>> (2L ^ 64 - 1).unsignedInteger(64)
18446744073709551615L

>>> (2L ^ 64).unsignedInteger(64)
0

>>> (2L ^ 64 * -2).unsignedInteger(64)
0
```

* * *

See also: LargeInteger, unsignedInteger

References:
_W_
[1](https://en.wikipedia.org/wiki/Two%27s_complement>)
