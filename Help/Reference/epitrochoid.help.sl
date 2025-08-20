# epitrochoid

- _epitrochoid(a, b, h)_

The roulette traced by a point _P_ attached to a circle _C_ of radius _b_,
rolling around the outside of a fixed circle of radius _a_.
_h_ is the distance from _P_ to the center of the circle _C_.

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	epitrochoid(3, 1, 1 / 2)
)
~~~

![](sw/spl/Help/Image/epitrochoid-A.svg)

With five cusps and _P_ outside of _C_:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	300,
	epitrochoid(5, 1, 7)
)
~~~

![](sw/spl/Help/Image/epitrochoid-B.svg)

With _c>a>b_:

~~~spl svg=C
(0 -- 6.pi).functionPlot(
	400,
	epitrochoid(1, 3 / 5, 6 / 5)
)
~~~

![](sw/spl/Help/Image/epitrochoid-C.svg)

An `epicycloid` is a special case of an epitrochoid where _h=b_.

* * *

See also: Circle, cos, epicycloid, hypotrochoid, sin

Guides: Curve Functions

References:
_Ferréol_
[1](https://mathcurve.com/courbes2d.gb/epitrochoid/epitrochoid.shtml),
_Mathematica_
[1](https://mathworld.wolfram.com/Epitrochoid.html)
_W_
[1](https://en.wikipedia.org/wiki/Epitrochoid)
