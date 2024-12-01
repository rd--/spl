# LineDrawing

- _LineDrawing(aList)_

A `LineDrawing` is a `Type` representing a line drawing.
The items in the drawing are 


A drawing consisting of two `Circle`s,
two `Line`s,
two `Point`s
and a `Rectangle`:

```spl svg=A
[
	Circle([0 0; 75 -25], [100 15]),
	Point([75 -25; 70 -20]),
	Line([-50 -25; 25 50:; -25 -15; 20 30]),
	Rectangle([-110 -150], [110 150])
].LineDrawing
```

![](sw/spl/Help/Image/LineDrawing-A.svg)

* * *

See also: Circle, draw, Line, Point, Polygon, Rectangle
