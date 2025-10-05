# centeredPolygonalNumber

- _centeredPolygonalNumber(k, n)_

Answer the _n_-th centered _k_-gonal number.

Centered triangular numbers:

```
>>> 1:17.collect { :n |
>>> 	3.centeredPolygonalNumber(n)
>>> }
[
	  1   4  10  19  31
	 46  64  85 109 136
	166 199 235 274 316
	361 409
]
```

Centered pentagonal numbers;

```
>>> 1:17.collect { :n |
>>> 	5.centeredPolygonalNumber(n)
>>> }
[
	  1   6  16  31  51
	 76 106 141 181 226
	276 331 391 456 526
	601 681
]
```

Centered hexagonal numbers;

```
>>> 1:17.collect { :n |
>>> 	6.centeredPolygonalNumber(n)
>>> }
[
	  1   7  19  37  61
	 91 127 169 217 271
	331 397 469 547 631
	721 817
]
```

* * *

See also: tetrahedralNumber, triangularNumber

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CenteredPolygonalNumber.html)
[2](https://mathworld.wolfram.com/CenteredTriangularNumber.html)
[3](https://mathworld.wolfram.com/CenteredSquareNumber.html)
[4](https://mathworld.wolfram.com/CenteredPentagonalNumber.html)
[5](https://mathworld.wolfram.com/HexNumber.html)
_OEIS_
[1](http://oeis.org/A005448)
[2](http://oeis.org/A001844)
[3](http://oeis.org/A005891)
[4](https://oeis.org/A003215),
_W_
[1](https://en.wikipedia.org/wiki/Centered_polygonal_number)
