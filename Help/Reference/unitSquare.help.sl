# unitSquare

- _unitSquare(center)_

A `Rectangle` with side lengths of `one` at _center_.

```
>>> [0 0].unitSquare
Rectangle([-0.5 -0.5], [0.5 0.5])

>>> [1/2 1/2].unitSquare
Rectangle([0 0], [1 1])
```

A drawing:

~~~spl svg=A
[0 0].unitSquare
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
	1.pi / [2 13 11 7]
) { :n :t |
	[n, n].unitSquare.asPolygon.rotated(t)
}.LineDrawing
~~~

![](sw/spl/Help/Image/unitSquare-C.svg)

* * *

See also: LineDrawing, Rectangle, regularPolygon, unitCircle, unitCube

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnitSquare.html),
_W_
[1](https://en.wikipedia.org/wiki/Unit_square)

Categories: Geometry
