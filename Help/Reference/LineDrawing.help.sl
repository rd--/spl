# LineDrawing

- _LineDrawing(aList)_

A `LineDrawing` is a `Type` representing a line drawing.
The items in the drawing are geometric entities.

A drawing consisting of two `Circle`s,
two `Line`s,
two `Point`s
and a `Rectangle`:

~~~spl svg=A
[
	Circle([0 0; 75 -25], [100 15]),
	Point([75 -25; 70 -20]),
	Line([-50 -25; 25 50:; -25 -15; 20 30]),
	Rectangle([-110 -150], [110 150])
].LineDrawing
~~~

![](sw/spl/Help/Image/LineDrawing-A.svg)

Twenty unit circles at equaly spaced points on the unit circle:

~~~spl svg=B
1:20.collect { :t |
	let p = 2.pi * t / 20;
	Circle([p.cos p.sin], 1)
}.LineDrawing
~~~

![](sw/spl/Help/Image/LineDrawing-B.svg)

Compare first two Bessel functions:

~~~spl svg=C
{ :n :x |
	[x / 5, besselJ(n, x)]
}.table(0:1, (0, 0.1 .. 14))
.Line
.LineDrawing
~~~

![](sw/spl/Help/Image/LineDrawing-C.svg)

* * *

See also: asLineDrawing, Circle, draw, Line, Point, Polygon, Rectangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Graphics.html)

Categories: Graphics
