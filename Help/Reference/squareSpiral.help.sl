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

First few _x_-coordinates,
OEIS [A174344](https://oeis.org/A174344):

```
>>> 30.squareSpiral.column(1)
[
	 0  1  1  0 -1 -1 -1  0  1  2
	 2  2  2  1  0 -1 -2 -2 -2 -2
	-2 -1  0  1  2  3  3  3  3  3
]
```

First few _y_-coordinates,
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

First few _x_-coordinates,
OEIS [A174344](https://oeis.org/A174344):

~~~spl svg=C oeis=A174344
65.squareSpiral.column(1).discretePlot
~~~

![](Help/Image/squareSpiral-C.svg)

First few _y_-coordinates,
OEIS [A268038](https://oeis.org/A268038):

~~~spl svg=D oeis=A268038
65.squareSpiral.column(2).discretePlot
~~~

![](Help/Image/squareSpiral-D.svg)

First few _y_-coordinates,
counterclockwise,
OEIS [A274923](https://oeis.org/A274923):

~~~spl svg=E oeis=A274923
65.squareSpiral('Counterclockwise')
.column(2).discretePlot
~~~

![](Help/Image/squareSpiral-E.svg)

Plot nine-spiral, counterclockwise:

~~~spl svg=F
211.squareSpiral('Counterclockwise').Line
~~~

![](Help/Image/squareSpiral-F.svg)

* * *

See also: evoluteSpiralMatrix, spiralMatrix

Guides: Geometry Functions

References:
_OEIS_
[1](https://oeis.org/A174344)
[2](https://oeis.org/A268038)
