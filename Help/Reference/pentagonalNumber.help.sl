# pentagonalNumber

- _pentagonalNumber(n)_

Answer the _n_-th pentagonal number.

```
>>> 23.pentagonalNumber
782
```

Threads over lists:

```
>>> 1:23.pentagonalNumber
[
	  1   5  12  22  35
	 51  70  92 117 145
	176 210 247 287 330
	376 425 477 532 590
	651 715 782
]
```

A linear recurrence:

```
>>> linearRecurrence([3 -3 1], [0 1 5], 23)
0:22.pentagonalNumber
```

C.f. `polygonalNumber`:

```
>>> 1:23.pentagonalNumber
5.polygonalNumber(1:23)
```

* * *

See also: binomial, cube, hexagonalNumber, pascalTriangle, polygonalNumber, square, tetrahedralNumber, triangularNumber

Guides: Integer Functions, Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PentagonalNumber.html),
_OEIS_
[1](https://oeis.org/A000326),
_W_
[1](https://en.wikipedia.org/wiki/Pentagonal_number)
