# unitSquare

- _unitSquare(center)_

A `Rectangle` with side lengths of `one` at _center_.

```
>>> [0 0].unitSquare
Rectangle([-0.5 -0.5], [0.5 0.5])
```

A drawing:

~~~spl svg=A
[0 0].unitSquare.asLineDrawing
~~~

![](sw/spl/Help/Image/unitSquare-A.svg)

Threads over lists:

~~~spl svg=B
[0 0; 1 1; 2 2].unitSquare.LineDrawing
~~~

![](sw/spl/Help/Image/unitSquare-B.svg)

Three rotated unit squares:

~~~spl svg=C
0:3.withCollect(
	pi / [2 13 11 7]
) { :n :t |
	[n, n].unitSquare.asPolygon.rotated(t)
}.LineDrawing
~~~

![](sw/spl/Help/Image/unitSquare-C.svg)

* * *

See also: LineDrawing, Rectangle, unitCircle

Categories: Geometry
