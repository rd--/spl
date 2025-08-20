# pentagram

- _pentagram(c, ρ, θ)_

Answer a `Polygon` representing a pentagram at center _c_, with curcumradius _ρ_ and rotation _θ_.

Draw a pentagram along with the circumcircle,
having radius _r_,
the circumcircle of the inner pentagon,
radius _a_,
the incircle of the inner pentagon,
radius _b_:

~~~spl svg=A
let r = (1/10 * (5 - 5.sqrt)).sqrt;
let a = 1/2 * (1/5 * (5 - (2 * 5.sqrt))).sqrt;
let b = (1/10 * (25 - (11 * 5.sqrt))).sqrt;
[
	[0 0].pentagram(r, 1/10.pi),
	Circle([0 0; 0 0; 0 0], [r a b])
].LineDrawing
~~~

![](sw/spl/Help/Image/pentagram-A.svg)

* * *

See also: goldenRatio, Polygon, starPolygon

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Pentagram.html),
_W_
[1](https://en.wikipedia.org/wiki/Pentagram)
