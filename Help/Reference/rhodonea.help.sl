# rhodonea

- _rhodonea(a, n)_

A rhodonea,
also called a rose curve,
is a special case of the more general `hypotrochoid`.

At _n=1_, a circle:

~~~spl svg=A
(0 -- 1.pi).subdivide(100)
.collect(rhodonea(1, 1))
.Line.asLineDrawing
~~~

![](sw/spl/Help/Image/rhodonea-A.svg)

At _n=2_, a quadrifolium, with period _2π_:

~~~spl svg=B
(0 -- 2.pi).subdivide(100)
.collect(rhodonea(1, 2))
.Line.asLineDrawing
~~~

![](sw/spl/Help/Image/rhodonea-B.svg)

At _n=3_, a trifolium:

~~~spl svg=C
(0 -- 1.pi).subdivide(100)
.collect(rhodonea(1, 3))
.Line.asLineDrawing
~~~

![](sw/spl/Help/Image/rhodonea-C.svg)

At _n=1/3_, a limaçon trisectrix, with period _3π_:

~~~spl svg=D
(0 -- 3.pi).subdivide(100)
.collect(rhodonea(1, 1 / 3))
.Line.asLineDrawing
~~~

![](sw/spl/Help/Image/rhodonea-D.svg)

At _n=1/2_, a Dürer folium, with period _4π_:

~~~spl svg=E
(0 -- 4.pi).subdivide(100)
.collect(rhodonea(1, 1 / 2))
.Line.asLineDrawing
~~~

![](sw/spl/Help/Image/rhodonea-E.svg)

At _n=2/3_, with period _6π_:

~~~spl svg=F
(0 -- 6.pi).subdivide(100)
.collect(rhodonea(1, 2 / 3))
.Line.asLineDrawing
~~~

![](sw/spl/Help/Image/rhodonea-F.svg)

At _n=1/4_, with period _8π_:

~~~spl svg=G
(0 -- 8.pi).subdivide(200)
.collect(rhodonea(1, 1 / 4))
.Line.asLineDrawing
~~~

![](sw/spl/Help/Image/rhodonea-G.svg)

At _n=3/5_, with period _5π_:

~~~spl svg=H
(0 -- 5.pi).subdivide(200)
.collect(rhodonea(1, 3 / 5))
.Line.asLineDrawing
~~~

![](sw/spl/Help/Image/rhodonea-H.svg)

At _n=9/7_, with period _7π_:

~~~spl svg=I
(0 -- 7.pi).subdivide(300)
.collect(rhodonea(1, 9 / 7))
.Line.asLineDrawing
~~~

![](sw/spl/Help/Image/rhodonea-I.svg)

* * *

See also: Circle, cos, epitrochoid, hypotrochoid, sin

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RoseCurve.html)
[2](https://mathworld.wolfram.com/Quadrifolium.html)
[3](https://mathworld.wolfram.com/Trifolium.html)
[4](https://mathworld.wolfram.com/LimaconTrisectrix.html)
_W_
[1](https://en.wikipedia.org/wiki/Rose_(mathematics))
[2](https://en.wikipedia.org/wiki/Quadrifolium)
[3](https://en.wikipedia.org/wiki/Lima%C3%A7on_trisectrix)
