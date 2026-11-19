# squareChladniPlateEquation

- _squareChladniPlateEquation(m, n)_

Answer the implicit equation for a square Chladni plate,
constrained at the center.
_n_ tells the number of nodes along each edge.

Plot for _1:5_:

~~~spl svg=A
let i = (0.0 -- 1.0).subdivide(25);
squareChladniPlateEquation(1.0, 5.0)
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/squareChladniPlateEquation-A.svg)

Plot for _2:5_:

~~~spl svg=B
let i = (0.0 -- 1.0).subdivide(25);
squareChladniPlateEquation(2.0, 5.0)
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/squareChladniPlateEquation-B.svg)

Plot for _3:5_:

~~~spl svg=C
let i = (0.0 -- 1.0).subdivide(25);
squareChladniPlateEquation(3.0, 5.0)
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/squareChladniPlateEquation-C.svg)

Plot for _4:5_:

~~~spl svg=D
let i = (0.0 -- 1.0).subdivide(25);
squareChladniPlateEquation(4.0, 5.0)
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/squareChladniPlateEquation-D.svg)

Plot for _1:4_:

~~~spl svg=E
let i = (0.0 -- 1.0).subdivide(25);
squareChladniPlateEquation(1.0, 4.0)
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/squareChladniPlateEquation-E.svg)

Plot for _2:4_:

~~~spl svg=F
let i = (0.0 -- 1.0).subdivide(25);
squareChladniPlateEquation(2.0, 4.0)
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/squareChladniPlateEquation-F.svg)

Plot for _2:7_:

~~~spl svg=G
let i = (0.0 -- 1.0).subdivide(25);
squareChladniPlateEquation(2.0, 7.0)
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/squareChladniPlateEquation-G.svg)

* * *

See also: contourPlot, cos

Guides: Curve Functions

References:
_P.Bourke_
[1](https://paulbourke.net/geometry/chladni/)
