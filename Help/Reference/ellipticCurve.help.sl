# ellipticCurve

- _ellipticCurve(a, b)_

Answer the implicit form of the elliptic curve, _x³+ax+b-y²=0_.

Plot at _a=-2,b=-1_:

~~~spl svg=A
let i = (-3 -- 3).subdivide(35);
ellipticCurve(-2, -1).contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/ellipticCurve-A.svg)

Plot at _a=-1,b=0_:

~~~spl svg=B
let i = (-3 -- 3).subdivide(35);
ellipticCurve(-1, 0).contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/ellipticCurve-B.svg)

Plot at _a=0,b=1_:

~~~spl svg=C
let i = (-3 -- 3).subdivide(35);
ellipticCurve(0, 1).contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/ellipticCurve-C.svg)

Plot at _a=1,b=2_:

~~~spl svg=D
let i = (-3 -- 3).subdivide(35);
ellipticCurve(1, 2).contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/ellipticCurve-D.svg)

Plot at _a=-2,b=2_:

~~~spl svg=E
let i = (-3 -- 3).subdivide(35);
ellipticCurve(-2, 2).contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/ellipticCurve-E.svg)

* * *

See also: contourPlot, ellipticCurveOverFiniteField

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EllipticCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Elliptic_curve)
