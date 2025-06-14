# epicycloid

- _epicycloid(a, b)_

An epicycloid is a special case of the more general `epitrochoid`,
where the parameter _h_ is set to _b_.

An epicycloid with one cusp is called a cardioid:

~~~spl svg=A
(0 -- 2.pi).subdivide(100)
.collect(epicycloid(1, 1))
.Line.asLineDrawing
~~~

![](sw/spl/Help/Image/epicycloid-A.svg)

An epicycloid with two cusps is called a nephroid:

~~~spl svg=B
(0 -- 2.pi).subdivide(100)
.collect(epicycloid(2, 1))
.Line.asLineDrawing
~~~

![](sw/spl/Help/Image/epicycloid-B.svg)

An epicycloid with five cusps is called a ranunculoid:

~~~spl svg=C
(0 -- 2.pi).subdivide(100)
.collect(epicycloid(5, 1))
.Line.asLineDrawing
~~~

![](sw/spl/Help/Image/epicycloid-C.svg)

An epicycloid with non-integer _a_ and period _4π_:

~~~spl svg=D
(0 -- 4.pi).subdivide(200)
.collect(epicycloid(11 / 2, 1))
.Line.asLineDrawing
~~~

![](sw/spl/Help/Image/epicycloid-D.svg)

* * *

See also: Circle, cos, epitrochoid, hypotrochoid, sin

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Epicycloid.html)
[2](https://mathworld.wolfram.com/Cardioid.html)
[3](https://mathworld.wolfram.com/Nephroid.html)
[4](https://mathworld.wolfram.com/Ranunculoid.html)
_W_
[1](https://en.wikipedia.org/wiki/Epicycloid)
[2](https://en.wikipedia.org/wiki/Cardioid)
[3](https://en.wikipedia.org/wiki/Nephroid)
