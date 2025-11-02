# torusKnotCurve

- _torusKnotCurve(p, q)_

Answer the parametric equation for the _(p,q)_-torus knot.

Plot a (3,8)-torus knot,
discarding the _z_ coordinate:

~~~spl svg=A
let f:/1 = torusKnotCurve(4, 7);
(0 -- 2.pi).functionPlot { :t |
	let [x, y, _] = f(t);
	[x, y]
}
~~~

![](sw/spl/Help/Image/torusKnotCurve-A.svg)

* * *

See also: cos, sin

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TorusKnot.html),
_W_
[1](https://en.wikipedia.org/wiki/Torus_knot)
