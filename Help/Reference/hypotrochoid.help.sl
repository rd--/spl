# hypotrochoid

- _hypotrochoid(a, b, h)_

Answer a `Block` of one argument that traces a hypotrochoid,
a roulette traced by a point attached to a circle of radius _b_ rolling around the inside of a fixed circle of radius _a_,
where the point is a distance _h_ from the center of the interior circle.

A hypotrochoid, in this case _h=a_:

~~~spl svg=A
(0 -- 6.pi).functionPlot(
	hypotrochoid(5, 3, 5)
)
~~~

![](sw/spl/Help/Image/hypotrochoid-A.svg)

An ellipse, _a=2b_:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	hypotrochoid(2, 1, 1 / 2)
)
~~~

![](sw/spl/Help/Image/hypotrochoid-B.svg)

A spirograph is a hypotrochoid, set _h_ as a proportion of _a_:

~~~spl svg=C
(0 -- 4.pi).functionPlot(
	hypotrochoid(7, 2, 0.4 * 7)
)
~~~

![](sw/spl/Help/Image/hypotrochoid-C.svg)

A `hypocycloid` is a special case of a `hypotrochoid`,
where _h=b_.

* * *

See also: botanicCurve, butterflyCurve, epitrochoid, hypocycloid, lissajousCurve

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Hypotrochoid.html)
[2](https://mathworld.wolfram.com/Spirograph.html),
_W_
[1](https://en.wikipedia.org/wiki/Hypotrochoid)
[2](https://en.wikipedia.org/wiki/Spirograph)
