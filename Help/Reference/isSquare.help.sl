# isSquare

- _isSquare(n)_

Answer `true` if the integer _n_ is a square number.

Square numbers,
OEIS [A000290](https://oeis.org/A000290):

```
>>> 0:99.select(isSquare:/1)
[0 1 4 9 16 25 36 49 64 81]

>>> 0:9 ^ 2
[0 1 4 9 16 25 36 49 64 81]
```

Number of ways of writing _n_ as a square,
OEIS [A000122](https://oeis.org/A000122):

```
>>> 0:104.collect { :n |
>>> 	[
>>> 		{ n = 0 } -> { 1 },
>>> 		{ n.isSquare } -> { 2 },
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

See also: isInteger, isIntegerSquare, square, sqrt

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SquareNumber.html),
_OEIS_
[1](https://oeis.org/A000290)
[2](https://oeis.org/A000122),
_W_
[1](https://en.wikipedia.org/wiki/Square_(algebra))
[2](https://en.wikipedia.org/wiki/Square_root)
