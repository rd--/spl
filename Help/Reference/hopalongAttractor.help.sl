# hopalongAttractor

- _hopalongAttractor(a, b, c)_

Hopalong attractors by Barry Martin.

~~~spl svg=A
hopalongAttractor(0.4, 1, 0)
.iterate([0 0])
.next(99)
.PointCloud
.asLineDrawing
~~~

![](sw/spl/Help/Image/hopalongAttractor-A.svg)

~~~spl svg=B
hopalongAttractor(-2, -0.33, 0.01)
.iterate([0 0])
.next(99)
.PointCloud
.asLineDrawing
~~~

![](sw/spl/Help/Image/hopalongAttractor-B.svg)

~~~spl svg=B
hopalongAttractor(6, -1, 3)
.iterate([0 0])
.next(99)
.PointCloud
.asLineDrawing
~~~

![](sw/spl/Help/Image/hopalongAttractor-C.svg)

* * *

See also: abs, sign, sqrt
