# vedicSquare

- _vedicSquare(n)_

A table formed by taking the `positiveResidue` of the multiplication table of the integer _n_.

```
>>> 9.vedicSquare
[
	1 2 3 4 5 6 7 8 9;
	2 4 6 8 1 3 5 7 9;
	3 6 9 3 6 9 3 6 9;
	4 8 3 7 2 6 1 5 9;
	5 1 6 2 7 3 8 4 9;
	6 3 9 6 3 9 6 3 9;
	7 5 3 1 8 6 4 2 9;
	8 7 6 5 4 3 2 1 9;
	9 9 9 9 9 9 9 9 9
]
```

The square is symmetric:

```
>>> 9.vedicSquare.isSymmetricMatrix
true
```

* * *

See also: %, commonResidue, positiveResidue

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A125959)
[2](https://oeis.org/A180592)
[3](https://oeis.org/A180593)
[4](https://oeis.org/A180594),
_W_
[1](https://en.wikipedia.org/wiki/Vedic_square)
