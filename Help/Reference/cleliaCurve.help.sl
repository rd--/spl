# cleliaCurve

- _cleliaCurve(c)_

A Clelia curve, or Clélie, is a curve on a sphere named by Luigi Guido Grandi after Clelia Borromeo.

Perspective drawing with _c=1/4_ and period _9π_:

~~~spl svg=A
(0 -- 9.pi).discretize(200)
.collect(cleliaCurve(1, 1 / 4))
.Line
.asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/cleliaCurve-A.svg)

Perspective drawing with _c=7/6_ and period _12π_:

~~~spl svg=B
(0 -- 12.pi).discretize(300)
.collect(cleliaCurve(1, 7 / 6))
.Line
.asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/cleliaCurve-B.svg)

When _c=1_, and period _2π_, the trace is a Viviani’s curve:

~~~spl svg=C
(0 -- 2.pi).discretize(100)
.collect(cleliaCurve(1, 1))
.Line
.asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/cleliaCurve-C.svg)

* * *

See also: cos, sin, Sphere

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/VivianisCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Cl%C3%A9lie)
[2](https://en.wikipedia.org/wiki/Viviani%27s_curve)
