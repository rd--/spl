# henonMap

- _henonMap(a, b)_

A two-dimensional dissipative quadratic map by Michel Hénon.

~~~spl svg=A
henonMap(1.4, 0.3)
.iterate([0 0])
.next(99)
.PointCloud
.asLineDrawing
~~~

![](sw/spl/Help/Image/henonMap-A.svg)

* * *

See also: deJongAttractor, henonAreaPreservingMap, martinMap

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HenonMap.html)

Further Reading: Hénon 1976
