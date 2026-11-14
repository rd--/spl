# digitLength

- _digitLength(n)_

Answer the number of bytes required to represent _n_.

```
>>> [1L 8L 16L 24L 32L 40L 48L 56L 64L].collect { :each |
>>> 	(2L ^ each).digitLength
>>> }
[1 .. 9]
```

A thirteen byte integer:

```
>>> (2L ^ 99L).digitLength
13
```

A 128-bit (16-byte) integer:

```
>>> let n = 2L ^ 128L - 1L;
>>> (n, n.digitLength)
(
	340282366920938463463374607431768211455L,
	16
)
```

* * *

See also: digitAt

Guides: Bitwise Functions, Integer Functions
