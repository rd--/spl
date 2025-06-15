# cleliaCurve

- _cleliaCurve(r, c)_

A Clelia curve, or Clélie, is a curve on a sphere named by Luigi Guido Grandi after Clelia Borromeo.

Perspective drawing with _c=1/2_ and period _4π_:

~~~spl svg=A
(0 -- 4.pi).functionPlot(
	cleliaCurve(1, 1 / 2)
)
~~~

![](sw/spl/Help/Image/cleliaCurve-A.svg)

With _c=7/6_ and period _12π_:

~~~spl svg=B
(0 -- 12.pi).functionPlot(
	300,
	cleliaCurve(1, 7 / 6)
)
~~~

![](sw/spl/Help/Image/cleliaCurve-B.svg)

With _c=1_ and period _2π_ the trace is Viviani’s curve:

~~~spl svg=C
(0 -- 2.pi).functionPlot(
	cleliaCurve(1, 1)
)
~~~

![](sw/spl/Help/Image/cleliaCurve-C.svg)

With _c=8_ and period _π_ the trace is a spherical spiral,
analogous to an Archimedean spiral in the plane:

~~~spl svg=D
(-1/2.pi -- 1/2.pi).functionPlot(
	200,
	cleliaCurve(1, 8)
)
~~~

![](sw/spl/Help/Image/cleliaCurve-D.svg)

* * *

See also: satelliteCurve, sphericalTrochoid

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/VivianisCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Cl%C3%A9lie)
[2](https://en.wikipedia.org/wiki/Viviani%27s_curve)
