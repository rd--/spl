# spirolateral

- _spirolateral([a], n, θ)_

Answer a `Polygon` of a spirolateral.

Regular polygons, _n=1_:

~~~spl svg=A
[1/3 1/2 2/3 3/4 5/7]
.collect { :x |
	[].spirolateral(1, x.pi)
}.LineDrawing
~~~

![](sw/spl/Help/Image/spirolateral-A.svg)

A simple spirolateral with a small whole divisor angle, _n=4_:

~~~spl svg=B
[].spirolateral(4, 5/7.pi)
~~~

![](sw/spl/Help/Image/spirolateral-B.svg)

A simple spirolateral with a small rational divisor angle, _n=6_:

~~~spl svg=C
[].spirolateral(6, 1/12.pi)
~~~

![](sw/spl/Help/Image/spirolateral-C.svg)

A general spirolateral:

~~~spl svg=D
[3].spirolateral(3, 1/5.pi)
~~~

![](sw/spl/Help/Image/spirolateral-D.svg)

A general spirolateral that is simpler than the simple form:

~~~spl svg=E
[3].spirolateral(3, 3/5.pi)
~~~

![](sw/spl/Help/Image/spirolateral-E.svg)

Simple spirolateral, _n=100_, four cycles:

~~~spl svg=F
[].spirolateral(100, 2/3.pi)
~~~

![](sw/spl/Help/Image/spirolateral-F.svg)

Regular unexpected closed spirolateral:

~~~spl svg=G
[1 5].spirolateral(8, 1/2.pi)
~~~

![](sw/spl/Help/Image/spirolateral-G.svg)

_54/6 → 18/2_:

~~~spl svg=H
[].spirolateral(6, 7/9.pi)
~~~

![](sw/spl/Help/Image/spirolateral-H.svg)

_60/6 → 30/3_:

~~~spl svg=I
[].spirolateral(6, 5/4.pi)
~~~

![](sw/spl/Help/Image/spirolateral-I.svg)

Crossed rectangle:

~~~spl svg=J
[2].spirolateral(2, 1/3.pi, 4)
~~~

![](sw/spl/Help/Image/spirolateral-J.svg)

A part of an infinite or open simple spirolateral:

~~~spl svg=K
[].spirolateral(9, 60.degree, 48)
~~~

![](sw/spl/Help/Image/spirolateral-K.svg)

* * *

See also: hypotrochoid, Polygon

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Spirolateral.html)
_W_
[1](https://en.wikipedia.org/wiki/Spirolateral)

Further Reading: Odds 1973
