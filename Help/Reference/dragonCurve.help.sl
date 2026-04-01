# dragonCurve

- _dragonCurve(n, k='A')_

Answer the _n_-th dragon curve,
also called the Heighway dragon curve.

_x_-coordinates of the dragon curve,
OEIS [A332383](https://oeis.org/A332383):

~~~spl svg=A oeis=A332383
7.dragonCurve('B').column(1)
.discretePlot
~~~

![](Help/Image/dragonCurve-A.svg)

_y_-coordinates of the dragon curve,
OEIS [A332384](https://oeis.org/A332384):

~~~spl svg=B oeis=A332384
7.dragonCurve('B').column(2)
.discretePlot
~~~

![](Help/Image/dragonCurve-B.svg)

The eighth dragon curve:

~~~spl svg=C
8.dragonCurve('B').Line
~~~

![](Help/Image/dragonCurve-C.svg)

The ninth dragon curve:

~~~spl svg=D
9.dragonCurve('B').Line
~~~

![](Help/Image/dragonCurve-D.svg)

_Note_: `dragonCurve` and `heighwayDragonCurve` are aliases.
The examples here show the _'B'_ construction of the curve.

* * *

See also: heighwayDragonCurve

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DragonCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Dragon_curve)
