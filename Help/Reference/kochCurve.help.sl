# kochCurve

- _kochCurve(n, k='A')_

Answer the vertices of a line segment representing the Koch curve.
There are two constructions.
_'A'_ answers the _n_-th step of the curve in Cartesian coordinates,
_'B'_ answers the first _n_ terms of the curve in hexagonal coordinates.

Lengths of successive approximations to the Koch curve,
OEIS [A052539](https://oeis.org/A052539):

```
>>> 0:4.collect { :n |
>>> 	n.kochCurve('A').size
>>> }
[2 5 17 65 257]

>>> 4 ^ 0:4 + 1
[2 5 17 65 257]
```

Drawing of the 4th step of the Koch curve:

~~~spl svg=A
4.kochCurve('A').Line
~~~

![](Help/Image/kochCurve-A.svg)

Drawing of the 5th step of the Koch curve:

~~~spl svg=B
5.kochCurve('A').Line
~~~

![](Help/Image/kochCurve-B.svg)

_x_-coordinates of the Koch curve on a hexagonal lattice,
OEIS [A335358](https://oeis.org/A335358):

~~~spl svg=C oeis=A335358
115.kochCurve('B')
.column(1)
.discretePlot
~~~

![](Help/Image/kochCurve-C.svg)

_y_-coordinates of the Koch curve on a hexagonal lattice,
OEIS [A335359](https://oeis.org/A335359):

~~~spl svg=D oeis=A335359
115.kochCurve('B')
.column(2)
.discretePlot
~~~

![](Help/Image/kochCurve-D.svg)

Koch curve on a hexagonal lattice:

~~~spl svg=E
115.kochCurve('B')
.fromHexagonalCoordinates
.Line
~~~

![](Help/Image/kochCurve-E.svg)

* * *

See also: angleVector, peanoCurve, simpleLindenmayerSystem, substitutionSystem

Guides: Curve Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/KochCurve.html),
_Riddle_
[1](https://larryriddle.agnesscott.org/ifs/kcurve/kcurve.htm),
_W_
[1](https://en.wikipedia.org/wiki/Koch_snowflake)
