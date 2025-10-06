# hexagonalNumber

- _hexagonalNumber(n)_

Answer the _n_-th hexagonal number.

```
>>> 23.hexagonalNumber
1035
```

Threads over lists:

```
>>> 1:23.hexagonalNumber
[
	  1    6   15   28   45
	 66   91  120  153  190
	231  276  325  378  435
	496  561  630  703  780
	861  946 1035
]
```

A linear recurrence:

```
>>> linearRecurrence([3 -3 1], [0 1 6], 23)
0:22.hexagonalNumber
```

C.f. `polygonalNumber`:

```
>>> 1:23.hexagonalNumber
6.polygonalNumber(1:23)
```

Test if a number is hexagonal:

```
>>> 1:100.select { :x |
>>> 	let n = (8 * x + 1).sqrt + 1;
>>> 	(n / 4).isInteger
>>> }
[1 6 15 28 45 66 91]
```

* * *

See also: binomial, cube, pascalTriangle, pentagonalNumber, polygonalNumber, square, tetrahedralNumber, triangularNumber

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HexagonalNumber.html),
_OEIS_
[1](https://oeis.org/A000384),
_W_
[1](https://en.wikipedia.org/wiki/Hexagonal_number)
