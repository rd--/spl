# squareSpiral

- _squareSpiral(n, k='Clockwise')_

Answer the _(x,y)_ unit coordinates of a square evolute spiral,
clockwise or counterclockwise,
starting at _0,0_ and at first rightwards.

```
>>> 16.squareSpiral
[
	 0  0;  1  0;  1 -1;  0 -1; -1 -1;
	-1  0; -1  1;  0  1;  1  1;  2  1;
	 2  0;  2 -1;  2 -2;  1 -2;  0 -2;
	-1 -2
]

>>> 16.squareSpiral('Counterclockwise')
[
	 0  0;  1  0;  1  1;  0  1; -1  1;
	-1  0; -1 -1;  0 -1;  1 -1;  2 -1;
	 2  0;  2  1;  2  2;  1  2;  0  2;
	-1  2
]
```

_x_-coordinates of square spiral,
OEIS [A174344](https://oeis.org/A174344):

```
>>> 30.squareSpiral.column(1)
[
	 0  1  1  0 -1 -1 -1  0  1  2
	 2  2  2  1  0 -1 -2 -2 -2 -2
	-2 -1  0  1  2  3  3  3  3  3
]
```

Closed form for _x_-coordinates of square spiral,
OEIS [A174344](https://oeis.org/A174344):

```
>>> 1:30.collect { :n |
>>> 	let m = (n - 1).integerSquareRoot;
>>> 	let k = (m / 2).ceiling;
>>> 	n := n - 1 - (4 * k.square);
>>> 	(n < 0).if {
>>> 		(n < -m).if { k } { -k - n }
>>> 	} {
>>> 		(n < m).if { -k } { n - (3 * k) }
>>> 	}
>>> }
[
	 0  1  1  0 -1 -1 -1  0  1  2
	 2  2  2  1  0 -1 -2 -2 -2 -2
	-2 -1  0  1  2  3  3  3  3  3
]
```

_y_-coordinates of square spiral,
clockwise,
OEIS [A268038](https://oeis.org/A268038),
and counterclockwise,
OEIS [A274923](https://oeis.org/A274923):

```
>>> 30.squareSpiral.column(2)
[
	 0  0 -1 -1 -1  0  1  1  1  1
	 0 -1 -2 -2 -2 -2 -2 -1  0  1
	 2  2  2  2  2  2  1  0 -1 -2
]

>>> 30.squareSpiral('Counterclockwise')
>>> .column(2)
[
	 0  0  1  1  1  0 -1 -1 -1 -1
	 0  1  2  2  2  2  2  1  0 -1
	-2 -2 -2 -2 -2 -2 -1  0  1  2
]
```

Closed form for _y_-coordinates of square spiral,
OEIS [A274923](https://oeis.org/A274923):

```
>>> 1:30.collect { :n |
>>> 	let m = (n - 1).integerSquareRoot;
>>> 	let k = (m / 2).ceiling;
>>> 	n := n - 1 - (4 * k.square);
>>> 	(n < 0).if {
>>> 		(n < -m).if { 3 * k + n } { k }
>>> 	} {
>>> 		(n < m).if { k - n } { -k }
>>> 	}
>>> }
[
	 0  0  1  1  1  0 -1 -1 -1 -1
	 0  1  2  2  2  2  2  1  0 -1
	-2 -2 -2 -2 -2 -2 -1  0  1  2
]
```

Sum of the _x_ and _y_-coordinates of the counter-clockwise square spiral,
OEIS [A180714](https://oeis.org/A180714):

```
>>> 30.squareSpiral('Counterclockwise')
>>> .collect(sum:/1)
[
	 0  1  2  1  0 -1 -2 -1  0  1
	 2  3  4  3  2  1  0 -1 -2 -3
	-4 -3 -2 -1  0  1  2  3  4  5
]
```

Sum of the _x_ and _y_-coordinates of the clockwise square spiral:

```
>>> 30.squareSpiral.collect(sum:/1)
[
	0 1 0 -1 -2 -1  0  1  2  3
	2 1 0 -1 -2 -3 -4 -3 -2 -1
	0 1 2  3  4  5  4  3  2  1
]
```

Pairs of coordinates for successive integers in the counterclockwise square spiral,
OEIS [A296030](https://oeis.org/A296030):

```
>>> 20.squareSpiral('Counterclockwise').catenate
[
	 0 0  1  0  1  1  0  1 -1  1
	-1 0 -1 -1  0 -1  1 -1  2 -1
	 2 0  2  1  2  2  1  2  0  2
	-1 2 -2  2 -2  1 -2  0 -2 -1
]
```

Plot seven-spiral:

~~~spl svg=A
211.squareSpiral.Line
~~~

![](Help/Image/squareSpiral-A.svg)

Plot eleven-spiral:

~~~spl svg=B
507.squareSpiral.Line
~~~

![](Help/Image/squareSpiral-B.svg)

_x_-coordinates of square spiral,
OEIS [A174344](https://oeis.org/A174344):

~~~spl svg=C oeis=A174344
65.squareSpiral.column(1).discretePlot
~~~

![](Help/Image/squareSpiral-C.svg)

_y_-coordinates of square spiral,
OEIS [A268038](https://oeis.org/A268038):

~~~spl svg=D oeis=A268038
65.squareSpiral.column(2).discretePlot
~~~

![](Help/Image/squareSpiral-D.svg)

_y_-coordinates of square spiral,
counterclockwise,
OEIS [A274923](https://oeis.org/A274923):

~~~spl svg=E oeis=A274923
65.squareSpiral('Counterclockwise')
.column(2).discretePlot
~~~

![](Help/Image/squareSpiral-E.svg)

Nine-spiral, counterclockwise:

~~~spl svg=F
211.squareSpiral('Counterclockwise')
.pointLinePlot
~~~

![](Help/Image/squareSpiral-F.svg)

Sum of the _x_ and _y_-coordinates the counter-clockwise square spiral,
OEIS [A180714](https://oeis.org/A180714):

~~~spl svg=G oeis=A180714
65.squareSpiral('Counterclockwise')
.collect(sum:/1).discretePlot
~~~

![](Help/Image/squareSpiral-G.svg)

Pairs of coordinates for successive integers in the counterclockwise square spiral,
OEIS [A296030](https://oeis.org/A296030):

~~~spl svg=H oeis=A296030
32.squareSpiral('Counterclockwise')
.catenate.discretePlot
~~~

![](Help/Image/squareSpiral-H.svg)

Pairs of coordinates for successive integers in the clockwise square spiral:

~~~spl svg=I
32.squareSpiral.catenate.discretePlot
~~~

![](Help/Image/squareSpiral-I.svg)

_x_-coordinates of one arm of a counterclockwise square spiral with four arms,
OEIS [A340944](https://oeis.org/A340944):

~~~spl svg=J oeis=A340944
85.squareSpiral('C')
.column(1)
.discretePlot
~~~

![](Help/Image/squareSpiral-J.svg)

_y_-coordinates of one arm of a counterclockwise square spiral with four arms,
OEIS [A340945](https://oeis.org/A340945):

~~~spl svg=K oeis=A340945
85.squareSpiral('C')
.column(2)
.discretePlot
~~~

![](Help/Image/squareSpiral-K.svg)

Pairs of coordinates of one arm of a counterclockwise square spiral with four arms:

~~~spl svg=L
42.squareSpiral('C')
.catenate
.discretePlot
~~~

![](Help/Image/squareSpiral-L.svg)

One arm of a counterclockwise square spiral with four arms:

~~~spl svg=M
250.squareSpiral('C').Line
~~~

![](Help/Image/squareSpiral-M.svg)

_x_-coordinates of one arm of a counterclockwise double square spiral,
OEIS [A340171](https://oeis.org/A340171):

~~~spl svg=N oeis=A340171
85.squareSpiral('B')
.column(1)
.discretePlot
~~~

![](Help/Image/squareSpiral-N.svg)

_y_-coordinates of one arm of a counterclockwise double square spiral,
OEIS [A340172](https://oeis.org/A340172):

~~~spl svg=O oeis=A340172
85.squareSpiral('B')
.column(2)
.discretePlot
~~~

![](Help/Image/squareSpiral-O.svg)

Pairs of coordinates of one arm of a counterclockwise double square spiral:

~~~spl svg=P
42.squareSpiral('B')
.catenate
.discretePlot
~~~

![](Help/Image/squareSpiral-P.svg)

One arm of a counterclockwise double square spiral:

~~~spl svg=Q
250.squareSpiral('B').Line
~~~

![](Help/Image/squareSpiral-Q.svg)

* * *

See also: evoluteSpiralMatrix, spiralMatrix, squareSpiralRank, squareSpiralUnrank

Guides: Geometry Functions

References:
_OEIS_
[1](https://oeis.org/A174344)
[2](https://oeis.org/A268038)
