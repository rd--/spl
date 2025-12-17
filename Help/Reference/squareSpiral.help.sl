# squareSpiral

- _squareSpiral(n)_

Answer the _(x,y)_ unit coordinates of a square clockwise evolute spiral starting at _0,0_ and at first rightwards.

```
>>> 16.squareSpiral
[
	 0  0;  1  0;  1 -1;  0 -1; -1 -1;
	-1  0; -1  1;  0  1;  1  1;  2  1;
	 2  0;  2 -1;  2 -2;  1 -2;  0 -2;
	-1 -2
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
OEIS [A268038](https://oeis.org/A268038):

```
>>> 30.squareSpiral.column(2)
[
	 0  0 -1 -1 -1  0  1  1  1  1
	 0 -1 -2 -2 -2 -2 -2 -1  0  1
	 2  2  2  2  2  2  1  0 -1 -2
]
```

Plot seven-spiral:

~~~spl svg=A
211.squareSpiral.Line
~~~

![](sw/spl/Help/Image/squareSpiral-A.svg)

Plot eleven-spiral:

~~~spl svg=B
507.squareSpiral.Line
~~~

![](sw/spl/Help/Image/squareSpiral-B.svg)

* * *

See also: evoluteSpiralMatrix, spiralMatrix

Guides: Geometry Functions

References:
_OEIS_
[1](https://oeis.org/A174344)
[2](https://oeis.org/A268038)
