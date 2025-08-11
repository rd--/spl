# starPolygon

- _starPolygon(p, q)_

Answer the star polygon _{p/q}_,
a figure formed by connecting with straight lines every _q_-th point out of _p_ regularly spaced points on a circle.

The _{5/2}_ star polygon, the pentagram:

~~~spl svg=A
5.starPolygon(2)
~~~

![](sw/spl/Help/Image/starPolygon-A.svg)

The _{7/2}_ star polygon, heptagram:

~~~spl svg=B
7.starPolygon(2)
~~~

![](sw/spl/Help/Image/starPolygon-B.svg)

The _{8/3}_ star polygon, the octagram:

~~~spl svg=C
8.starPolygon(3)
~~~

![](sw/spl/Help/Image/starPolygon-C.svg)

The _{10/3}_ star polygon, the decagram:

~~~spl svg=D
10.starPolygon(3)
~~~

![](sw/spl/Help/Image/starPolygon-D.svg)

The _{12/5}_ star polygon, the dodecagram:

~~~spl svg=E
12.starPolygon(5)
~~~

![](sw/spl/Help/Image/starPolygon-E.svg)

When _q_ is `one` the a _p_-regular polygon is obtained,
the {5} star polygon:

~~~spl svg=F
5.starPolygon(1)
~~~

![](sw/spl/Help/Image/starPolygon-F.svg)

The _{9/2}_ star polygon:

~~~spl svg=G
9.starPolygon(2)
~~~

![](sw/spl/Help/Image/starPolygon-G.svg)

The three heptagrams _{7}+{7/2}+{7/3}_:

~~~spl svg=H
[1 2 3].collect { :q |
	7.starPolygon(q)
}.LineDrawing
~~~

![](sw/spl/Help/Image/starPolygon-H.svg)

The _{19/7}_ star polygon:

~~~spl svg=I
19.starPolygon(7)
~~~

![](sw/spl/Help/Image/starPolygon-I.svg)

* * *

See also: Polgyon, starFigure

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StarPolygon.html)
[2](https://mathworld.wolfram.com/Pentagram.html)
[3](https://mathworld.wolfram.com/Octagram.html)
[4](https://mathworld.wolfram.com/Decagram.html)
[5](https://mathworld.wolfram.com/Dodecagram.html),
_W_
[1](https://en.wikipedia.org/wiki/Star_polygon)
[2](https://en.wikipedia.org/wiki/Pentagram)
[3](https://en.wikipedia.org/wiki/Heptagram)
[4](https://en.wikipedia.org/wiki/Octagram)
[5](https://en.wikipedia.org/wiki/Enneagram_(geometry))
[6](https://en.wikipedia.org/wiki/Decagram_(geometry))
