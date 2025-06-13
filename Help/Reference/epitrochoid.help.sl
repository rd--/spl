# epitrochoid

- _epitrochoid(b, a, h)_

The roulette traced by a point _P_ attached to a circle _C_ of radius _b_,
rolling around the outside of a fixed circle of radius _a_.
_h_ is the distance from _P_ to the center of the circle _C_.

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	epitrochoid(1, 3, 1 / 2)
)
~~~

![](sw/spl/Help/Image/epitrochoid-A.svg)

With five cusps and _P_ outside of _C_:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	epitrochoid(1, 5, 7)
)
~~~

![](sw/spl/Help/Image/epitrochoid-B.svg)

* * *

See also: Circle, cos, hypotrochoid, sin

Guides: Algebraic Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Epitrochoid.html)
[2](https://mathworld.wolfram.com/Epicycloid.html),
_W_
[1](https://en.wikipedia.org/wiki/Epitrochoid)
