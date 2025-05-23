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

A hypocycloid, _h=b_, in this case an _astroid_:

~~~spl svg=C
(0 -- 2.pi).functionPlot(
	hypotrochoid(4, 1, 1)
)
~~~

![](sw/spl/Help/Image/hypotrochoid-C.svg)

Another hypocycloid, in this case a _deltoid_:

~~~spl svg=D
(0 -- 2.pi).subdivide(100).collect(
	hypotrochoid(3, 1, 1)
).asLineDrawing
~~~

![](sw/spl/Help/Image/hypotrochoid-D.svg)

Another hypocycloid, with non-integer _a_:

~~~spl svg=E
(0 -- 4.pi).functionPlot(
	hypotrochoid(5.5, 1, 1)
)
~~~

![](sw/spl/Help/Image/hypotrochoid-E.svg)

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Hypotrochoid.html)
[2](https://mathworld.wolfram.com/Hypocycloid.html)
[3](https://mathworld.wolfram.com/Astroid.html)
[4](https://mathworld.wolfram.com/Deltoid.html)
_W_
[1](https://en.wikipedia.org/wiki/Hypotrochoid)
[2](https://en.wikipedia.org/wiki/Hypocycloid)
[3](https://en.wikipedia.org/wiki/Astroid)
[4](https://en.wikipedia.org/wiki/Deltoid_curve)
