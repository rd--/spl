# deJongAttractor

- _deJongAttractor(a, b, c, d)_

Iterative attractor function by Peter de Jong.

Plot small iteration count:

~~~spl svg=A
deJongAttractor(-2.24, 0.43, -0.65, -2.43)
.iterate([0 0])
.next(99)
.PointCloud
.asLineDrawing
~~~

![](sw/spl/Help/Image/deJongAttractor-A.svg)

Draw small iteration count:

~~~spl svg=B
deJongAttractor(-2.7, -0.09, -0.86, -2.2)
.iterate([0 0])
.next(999)
.PointCloud
.asBitmap(100)
~~~

![](sw/spl/Help/Image/deJongAttractor-B.png)

* * *

See also: henonMap, henonAreaPreservingMap, martinMap
