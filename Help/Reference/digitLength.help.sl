# digitLength

- _digitLength(n)_

Answer the number of bytes required to represent _n_.

```
>>> [1 8 16 24 32 40 48 56 64].collect { :each |
>>> 	(2L ^ each).digitLength
>>> }
[1 .. 9]
```

A thirteen byte integer:

```
>>> (2L ^ 99).digitLength
13
```

A 128-bit (16-byte) integer:

```
>>> let n = 2L ^ 128 - 1;
>>> (n, n.digitLength)
(
	340282366920938463463374607431768211455L,
	16
)
```

* * *

See also: digitAt

Guides: Bitwise Functions, Integer Functions
