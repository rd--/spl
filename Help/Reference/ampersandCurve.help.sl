# ampersandCurve

- _ampersandCurve(θ)_

Implements a discontinuous paramteric equation for the ampersand curve.

~~~spl svg=A
(0 -- 2.pi)
.discretize(200, ampersandCurve:/1)
.deleteMissing
.PointCloud
~~~

![](sw/spl/Help/Image/ampersandCurve-A.svg)

* * *

See also: ampersandImplicitCurve

Guides: Curve Functions

References:
_Ferréol_
[1](https://mathcurve.com/courbes2d.gb/quarticdeplucker/quarticdeplucker.shtml),
_Mathematica_
[1](https://mathworld.wolfram.com/PlueckersQuartic.html)
[2](https://mathworld.wolfram.com/AmpersandCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Ampersand_curve)
