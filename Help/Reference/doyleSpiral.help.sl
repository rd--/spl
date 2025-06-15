# doyleSpiral

- _doyleSpiral(p, q, [⌊ ⌈])_

Answer a Doyle spiral,
a pattern of non-crossing circles in the plane in which each circle is surrounded by a ring of six tangent circles.

With _p=8,q=16_:

~~~spl svg=A
doyleSpiral(8, 16, [1 100])
.LineDrawing
~~~

![](sw/spl/Help/Image/doyleSpiral-A.svg)

With _p=2,q=3_,
Coxeter’s loxodromic sequence of tangent circles:

~~~spl svg=B
doyleSpiral(2, 3, [1 100])
.LineDrawing
~~~

![](sw/spl/Help/Image/doyleSpiral-B.svg)

With _p=6,q=8_:

~~~spl svg=C
doyleSpiral(6, 8, [1 100])
.LineDrawing
~~~

![](sw/spl/Help/Image/doyleSpiral-C.svg)

With _p=9,q=9_:

~~~spl svg=D
doyleSpiral(9, 9, [1 150])
.LineDrawing
~~~

![](sw/spl/Help/Image/doyleSpiral-D.svg)

* * *

See also: archimedeanSpiral

Guides: Geometry Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Doyle_spiral)
