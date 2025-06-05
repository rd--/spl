# cubicHermiteFunction

- _cubicHermiteFunction(p, t)_

Answer a cubic Hermite function defined by the points _p_ and tangents _t_.

Plot cubic Hermite function in two dimensions:

~~~spl svg=A
let p = [-1 0; 0 0; 1 0];
let t = [1 1; 0 1; 1 1];
(0 -- 1).functionPlot(
	p.cubicHermiteFunction(t)
)
~~~

![](sw/spl/Help/Image/cubicHermiteFunction-A.svg)

* * *

See also: bezierFunction, bSplineFunction

Guides: Interpolation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HermitePolynomial.html),
_W_
[1](https://en.wikipedia.org/wiki/Cubic_Hermite_spline)
