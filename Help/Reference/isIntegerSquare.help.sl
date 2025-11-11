# isIntegerSquare

- _isIntegerSquare(n)_

Answer `true` if _n_ is the square of an integer, else `false`.

First few terms,
OEIS [A000290](https://oeis.org/A000290):

```
>>> 1:100.select(isIntegerSquare:/1)
[1 4 9 16 25 36 49 64 81 100]
```

First few terms of OEIS [A000122](https://oeis.org/A000122):

>>> 0:104.collect { :n |
>>> 	[
>>> 		{ n = 0 } -> { 1 },
>>> 		{ n.isIntegerSquare } -> { 2 },
>>> 		{ true } -> { 0 }
>>> 	].which
>>> }
[
	1 2 0 0 2 0 0 0 0 2 0 0 0 0 0 0 2 0 0 0
	0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 2 0 0 0
	0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0
	0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	2 0 0 0 0
]
```

* * *

See also: square, sqrt

Guides: Integer Functions

References:
_OEIS_
[1](https://oeis.org/A000290)
[2](https://oeis.org/A000122)
