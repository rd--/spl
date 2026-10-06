# LineDrawing

- _LineDrawing(x)_

Answer a `LineDrawing` of the drawable object _x_,
A `LineDrawing` is a `Type` representing a line drawing.
The items in the drawing are geometric entities.

A drawing consisting of two `Circle`s,
two `Line`s,
two `Point`s
and a `Rectangle`:

~~~spl svg=A
[
	Circle([0 0; 75 -25], [100 15]),
	Point[75 -25; 70 -20],
	Line[-50 -25; 25 50:; -25 -15; 20 30],
	Rectangle[-110 -150; 110 150]
].LineDrawing
~~~

![](Help/Image/LineDrawing-A.svg)

Twenty unit circles at equaly spaced points on the unit circle:

~~~spl svg=B
1:20.collect { :t |
	let p = 2.pi * t / 20;
	Circle([p.cos p.sin], 1)
}.LineDrawing
~~~

![](Help/Image/LineDrawing-B.svg)

Compare first two Bessel functions:

~~~spl svg=C
{ :n :x |
	[x / 5, besselJ(n, x)]
}.table(0:1, (0, 0.1 .. 14))
.Line
.LineDrawing
~~~

![](Help/Image/LineDrawing-C.svg)

At `Circle`:

~~~spl svg=D
Circle([0 0], 1).LineDrawing
~~~

![](Help/Image/LineDrawing-D.svg)

At `Rectangle`:

~~~spl svg=E
Rectangle[0 0; 1 1].LineDrawing
~~~

![](Help/Image/LineDrawing-E.svg)

At `Polygon`:

~~~spl svg=F
Polygon[0 0; 1 2; 2 0].LineDrawing
~~~

![](Help/Image/LineDrawing-F.svg)

At `Triangle`:

~~~spl svg=G
Triangle[0 0; 1 2; 2 0].LineDrawing
~~~

![](Help/Image/LineDrawing-G.svg)

At `PointCloud`:

~~~spl svg=H
Sfc32(156732)
.randomInteger([0 27], [23, 2])
.PointCloud
.LineDrawing
~~~

![](Help/Image/LineDrawing-H.svg)

At `Plot`:

~~~spl svg=I
[1 .. 9].discretePlot.LineDrawing
~~~

![](Help/Image/LineDrawing-I.svg)

At `Scale`:

~~~spl svg=J
Scale([2 2 3 2 3], 'Maj. Pentatonic')
.LineDrawing
~~~

![](Help/Image/LineDrawing-J.svg)

At `Graph`:

~~~spl svg=K
RatioTuning[
	1/1 8/7 3/2 8/5 7/4
].tuningLatticeGraph
.LineDrawing
~~~

![](Help/Image/LineDrawing-K.svg)

Draw the cochleoid curve:

~~~spl svg=L
(-4.pi -- 4.pi).discretize(200) { :theta |
	[theta.sin / theta, theta].fromPolarCoordinates
}.Line.LineDrawing
~~~

![](Help/Image/LineDrawing-L.svg)

Answer a colour `LineDrawing` representing the matrix _m_.
The elements of _m_ must implement `Colour`.
A 3×3×3 array,
understood as a 3×3 or _(r,g,b)_ triples:

~~~spl svg=M
[
	0 0.6 0; 0.4 0.1 0.8; 0.7 0.9 0.7:;
	1 0 0.9; 0.6 0.6 1; 1 0.8 0.3
].ColourGrid.LineDrawing
~~~

![](Help/Image/LineDrawing-M.svg)

A 5×11×3 array,
understood as a 5×11 matrix of _(r,g,b)_ triples:

~~~spl svg=N
Sfc32(731894)
.randomReal([0 1], [5 11 3])
.ColourGrid.LineDrawing
~~~

![](Help/Image/LineDrawing-N.svg)

* * *

See also: Circle, Line, PerspectiveDrawing, Point, Polygon, Plot, Rectangle, draw

Guides: Drawing Functions, Image Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Graphics.html)

Categories: Graphics
