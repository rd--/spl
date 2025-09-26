# asLineDrawing

- _asLineDrawing(x)_

Answer a `LineDrawing` of the drawable object _x_.

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
.randomInteger([0 27], [23, 2])
.PointCloud
.asLineDrawing
~~~

![](sw/spl/Help/Image/asLineDrawing-E.svg)

At `Plot`:

~~~spl svg=F
[1 .. 9].discretePlot.asLineDrawing
~~~

![](sw/spl/Help/Image/asLineDrawing-F.svg)

At `Scale`:

~~~spl svg=G
Scale(1, [2 2 3 2 3], 'Maj. Pentatonic')
.asLineDrawing
~~~

![](sw/spl/Help/Image/asLineDrawing-G.svg)

At `Graph`:

~~~spl svg=H
[1/1 8/7 3/2 8/5 7/4]
.asRatioTuning
.tuningLatticeGraph
.asLineDrawing
~~~

![](sw/spl/Help/Image/asLineDrawing-H.svg)

Draw the cochleoid curve:

~~~spl svg=I
(-4.pi -- 4.pi).discretize(200) { :theta |
	[theta.sin / theta, theta].fromPolarCoordinates
}.Line.asLineDrawing
~~~

![](sw/spl/Help/Image/asLineDrawing-I.svg)

* * *

See also: asPerspectiveDrawing, Circle, LineDrawing, Plot, Polygon, Rectangle, Scale, textDrawing, Triangle

Guides: Drawing Functions, Image Functions

Categories: Converting
