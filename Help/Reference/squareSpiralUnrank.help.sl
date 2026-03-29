# squareSpiralUnrank

- _squareSpiralUnrank(n)_

Answer the _n_-th coordinate of the counter-clockwise square spiral.

First ten coordinates:

```
>>> 1:10.squareSpiralUnrank
[
	 0 0;  1  0; 1  1; 0  1; -1  1;
	-1 0; -1 -1; 0 -1; 1 -1;  2 -1
]
```

The inverse is `squareSpiralRank`:

```
>>> 1:10.squareSpiralUnrank
>>> .squareSpiralRank
[1 2 3 4 5 6 7 8 9 10]
```

_x_-coordinates of square spiral,
OEIS [A174344](https://oeis.org/A174344):

```
>>> 1:20.squareSpiralUnrank.column(1)
[
	 0  1  1  0 -1 -1 -1  0  1  2
	 2  2  2  1  0 -1 -2 -2 -2 -2
]
```

_y_-coordinates of square spiral,
OEIS [A274923](https://oeis.org/A274923):

```
>>> 1:20.squareSpiralUnrank.column(2)
[
	 0  0  1  1  1  0 -1 -1 -1 -1
	 0  1  2  2  2  2  2  1  0 -1
]
```

The first one hundred coordinates of the square spiral,
point-line plot:

~~~spl svg=A
1:100.squareSpiralUnrank
.pointLinePlot
~~~

![](Help/Image/squareSpiralUnrank-A.svg)

* * *

See also: squareSpiral

Guides: Geometry Functions, Integer Functions

References:
_OEIS_
[1](https://oeis.org/A174344)
[2](https://oeis.org/A274923)
