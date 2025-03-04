# martinMap

- _martinMap(a, b, c)_

A function by Barry Martin.

~~~spl svg=A
martinMap(0.4, 1, 0)
.iterate([0 0])
.next(99)
.PointCloud
.asLineDrawing
~~~

![](sw/spl/Help/Image/martinMap-A.svg)

~~~spl svg=B
martinMap(-2, -0.33, 0.01)
.iterate([0 0])
.next(99)
.PointCloud
.asLineDrawing
~~~

![](sw/spl/Help/Image/martinMap-B.svg)

~~~spl svg=C
martinMap(6, -1, 3)
.iterate([0 0])
.next(99)
.PointCloud
.asLineDrawing
~~~

![](sw/spl/Help/Image/martinMap-C.svg)

* * *

See also: deJongAttractor, henonAreaPreservingMap, henonMap
