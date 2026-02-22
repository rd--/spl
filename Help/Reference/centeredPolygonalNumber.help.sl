# centeredPolygonalNumber

- _centeredPolygonalNumber(k, n)_

Answer the _n_-th centered _k_-gonal number.

Centered triangular numbers,
OEIS [A005448](https://oeis.org/A005448):

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

Centered square numbers,
OEIS [A001844](https://oeis.org/A001844):

```
>>> 1:17.collect { :n |
>>> 	4.centeredPolygonalNumber(n)
>>> }
[
	  1   5  13  25  41
	 61  85 113 145 181
	221 265 313 365 421
	481 545
]
```

Centered pentagonal numbers,
OEIS [A005891](https://oeis.org/A005891):

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

Centered hexagonal numbers,
OEIS [A003215](https://oeis.org/A003215):

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

Centered heptagonal numbers,
OEIS [A069099](https://oeis.org/A069099):

```
>>> 1:17.collect { :n |
>>> 	7.centeredPolygonalNumber(n)
>>> }
[
	  1   8  22  43  71
	106 148 197 253 316
	386 463 547 638 736
	841 953
]
```

Centered octagonal numbers,
OEIS [A016754](https://oeis.org/A016754):

```
>>> 1:9.collect { :n |
>>> 	8.centeredPolygonalNumber(n)
>>> }
[1 9 25 49 81 121 169 225 289]
```

Centered 18-gonal numbers,
OEIS [A069131](https://oeis.org/A069131):

```
>>> 1:17.collect { :n |
>>> 	18.centeredPolygonalNumber(n)
>>> }
[
	   1   19   55  109  181
	 271  379  505  649  811
	 991 1189 1405 1639 1891
	2161 2449
]
```

Centered icosagonal numbers,
OEIS [A069133](https://oeis.org/A069133):

```
>>> 1:17.collect { :n |
>>> 	20.centeredPolygonalNumber(n)
>>> }
[
	   1   21   61  121  201
	 301  421  561  721  901
	1101 1321 1561 1821 2101
	2401 2721
]

>>> [3 -3 1].linearRecurrence([1 21 61], 9)
[1 21 61 121 201 301 421 561 721]
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
[1](https://oeis.org/A005448)
[2](https://oeis.org/A001844)
[3](https://oeis.org/A005891)
[4](https://oeis.org/A003215)
[5](https://oeis.org/A069099),
_W_
[1](https://en.wikipedia.org/wiki/Centered_polygonal_number)
[2](https://en.wikipedia.org/wiki/Centered_triangular_number)
[3](https://en.wikipedia.org/wiki/Centered_square_number)
[4](https://en.wikipedia.org/wiki/Centered_pentagonal_number)
[5](https://en.wikipedia.org/wiki/Centered_hexagonal_number)
[6](https://en.wikipedia.org/wiki/Centered_heptagonal_number)
