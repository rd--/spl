# signedInteger

- _signedInteger(n, k)_

`signedInteger` answers _n_ constrained to be a _k_-bit signed integer,
represented using two’s-complement notation.

```
>>> 25L.signedInteger(4L)
-7

>>> (2b11001, 2b0110 + 1 * -1)
(25, -7)

>>> 2L ^ 63L - 1L
9223372036854775807L

>>> (2L ^ 63L - 1L).signedInteger(64L)
9223372036854775807L

>>> (2L ^ 63L).signedInteger(64L)
-9223372036854775808L

>>> (2L ^ 63L * -2L).signedInteger(64L)
0
```

`unsignedInteger` answers _n_ constrained to be an _k_-bit unsigned integer:

```
>>> 25L.unsignedInteger(4L)
9

>>> (2b11001, 2b01001)
(25, 9)

>>> 2L ^ 64L - 1L
18446744073709551615L

>>> (2L ^ 64L - 1L).unsignedInteger(64)
18446744073709551615L

>>> (2L ^ 64L).unsignedInteger(64)
0

>>> (2L ^ 64L * -2L).unsignedInteger(64)
0
```

* * *

See also: Integer, unsignedInteger

References:
_W_
[1](https://en.wikipedia.org/wiki/Two%27s_complement>)
