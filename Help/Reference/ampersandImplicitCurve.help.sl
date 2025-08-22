# ampersandImplicitCurve

- _ampersandImplicitCurve(x, y)_

Implements the implicit equation for the ampersand curve.

Plot at `zero`:

~~~spl svg=A
let i = (-1.5 -- 1.5).subdivide(100);
ampersandCurve:/2.
contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/ampersandImplicitCurve-A.svg)

* * *

See also: ampersandCurve, contourPlot

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AmpersandCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Ampersand_curve)
