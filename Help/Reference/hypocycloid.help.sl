# hypocycloid

- _hypocycloid(a, b)_

A hypocycloid is a special case of the more general `hypotrochoid`,
where the parameter _h_ is set to _b_.

An _astroid_,
a 4-cusped hypocycloid also called a tetracuspid, cubocycloid, or paracycle:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	hypocycloid(4, 1)
)
~~~

![](sw/spl/Help/Image/hypocycloid-A.svg)

A _deltoid_,
a 3-cusped hypocycloid, also called a tricuspoid:

~~~spl svg=B
(0 -- 2.pi).subdivide(100).collect(
	hypocycloid(3, 1)
).Line
~~~

![](sw/spl/Help/Image/hypocycloid-B.svg)

A hypocycloid with non-integer _a_:

~~~spl svg=C
(0 -- 4.pi).functionPlot(
	hypocycloid(5.5, 1)
)
~~~

![](sw/spl/Help/Image/hypocycloid-C.svg)

A _Tusi couple_,
a 2-cusped hypocycloid,
which is a straight line:

~~~spl svg=D
let a = 2;
let b = 1;
let c = [0 0.25 0.5 0.75 1].pi.collect(
	hypocycloid(2, 1)
);
[
	PointCloud(c),
	Line(c),
	Circle([0 0], a)
].LineDrawing
~~~

![](sw/spl/Help/Image/hypocycloid-D.svg)

* * *

See also: botanicCurve, butterflyCurve, cycloid, epitrochoid, hypotrochoid, lissajousCurve

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Hypocycloid.html)
[2](https://mathworld.wolfram.com/Hypocycloid.html)
[3](https://mathworld.wolfram.com/Astroid.html)
[4](https://mathworld.wolfram.com/Deltoid.html)
[5](https://mathworld.wolfram.com/TusiCouple.html)
_W_
[1](https://en.wikipedia.org/wiki/Hypocycloid)
[2](https://en.wikipedia.org/wiki/Hypocycloid)
[3](https://en.wikipedia.org/wiki/Astroid)
[4](https://en.wikipedia.org/wiki/Deltoid_curve)
