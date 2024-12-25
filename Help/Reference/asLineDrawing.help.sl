# asLineDrawing

- _asLineDrawing(anObject)_

Answer a `LineDrawing` of _anObject_.

At `Circle`:

~~~spl svg=A
Circle([0 0], 1).asLineDrawing
~~~

![](sw/spl/Help/Image/asLineDrawing-A.svg)

At `Rectangle`:

~~~spl svg=B
Rectangle([0 0], [1 1]).asLineDrawing
~~~

![](sw/spl/Help/Image/asLineDrawing-B.svg)

At `Polygon`:

~~~spl svg=C
Polygon([0 0; 1 2; 2 0]).asLineDrawing
~~~

![](sw/spl/Help/Image/asLineDrawing-C.svg)

At `Triangle`:

~~~spl svg=D
Triangle([0 0], [1 2], [2 0]).asLineDrawing
~~~

![](sw/spl/Help/Image/asLineDrawing-D.svg)

At `PointCloud`:

~~~spl svg=E
Sfc32(156732)
.randomInteger(0, 27, [23, 2])
.PointCloud
.asLineDrawing
~~~

![](sw/spl/Help/Image/asLineDrawing-E.svg)

* * *

See also: Circle, LineDrawing, Polygon, Rectangle, Triangle

Categories: Converting
