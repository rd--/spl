# squarePyramidalNumber

- _squarePyramidalNumber(n)_

Answer the _n_-th square pyramidal number,
the sum of the first _n_ square numbers.

First few square pyramidal numbers,
threads over lists,
OEIS [A000330](https://oeis.org/A000330):

```
>>> 0:27.squarePyramidalNumber
[
	   0    1    5   14   30
	  55   91  140  204  285
	 385  506  650  819 1015
	1240 1496 1785 2109 2470
	2870 3311 3795 4324 4900
	5525 6201 6930
]
```

Relation to `tetrahedralNumber`:

```
>>> 0:9.tetrahedralNumber
>>> .adjacentPairsCollect(+)
[1 5 14 30 55 91 140 204 285]

1:9.squarePyramidalNumber
[1 5 14 30 55 91 140 204 285]
```

Square pyramidal numbers,
OEIS [A000330](https://oeis.org/A000330):

~~~spl svg=A oeis=A000330
0:65.squarePyramidalNumber
.discretePlot
~~~

![](sw/spl/Help/Image/squarePyramidalNumber-A.svg)

* * *

See also: ^, *, square, sqrt

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SquarePyramidalNumber.html),
_OEIS_
[1](https://oeis.org/A000330),
_W_
[1](https://en.wikipedia.org/wiki/Square_pyramidal_number)
