# centeredHexagonalNumber

- _centeredHexagonalNumber(n)_

Answer the _n_-th centered hexagonal number,
a centered figurate number that represents a hexagononal lattice with a dot in the center.

```
>>> 1:53.collect(centeredHexagonalNumber:/1)
[
	1 7 19 37 61 91
	127 169 217 271 331
	397 469 547 631 721
	817 919 1027 1141 1261
	1387 1519 1657 1801 1951
	2107 2269 2437 2611 2791
	2977 3169 3367 3571 3781
	3997 4219 4447 4681 4921
	5167 5419 5677 5941 6211
	6487 6769 7057 7351 7651
	7957 8269
]
```

Differences are multiples of six:

```
>>> 1:23.collect(centeredHexagonalNumber:/1)
>>> .differences
[
	  6  12  18  24  30  36  42  48  54  60
	 66  72  78  84  90  96 102 108 114 120
	126 132
]
```

* * *

See also: tetrahedralNumber, triangularNumber

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HexNumber.html),
_OEIS_
[1](https://oeis.org/A003215),
_W_
[1](https://en.wikipedia.org/wiki/Centered_hexagonal_number)
