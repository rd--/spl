# Parallelogram

- _Parallelogram(p, [u v])_

A `Type` holding a parallelogram with origin _p_ and directions _u_ and _v_.

```
>>> let p = Parallelogram([0 0], [1 0; 1 1]);
>>> (p.area, p.vertexCoordinates)
(
	1,
	[0 0; 1 0; 2 1; 1 1]
)
```

Draw a parallelogram:

~~~spl svg=A
Parallelogram([0 0], [3 0; 1 4])
~~~

![](sw/spl/Help/Image/Parallelogram-A.svg)

A parallelogram with sides that form right angles is a rectangle:

~~~spl svg=B
Parallelogram([2 1], [1 2; 4 -2])
~~~

![](sw/spl/Help/Image/Parallelogram-B.svg)

A parallelogram can tile the plane:

~~~spl svg=C
{ :i :j |
	Parallelogram(
		([3 0] * i) + ([1 4] * j),
		[3 0; 1 4]
	)
}.table(1:5, 1:5).LineDrawing
~~~

![](sw/spl/Help/Image/Parallelogram-C.svg)

Two parallelograms having equal bases and equal altitudes are also of equal content,
three equal area parallelograms:

~~~spl svg=D
let y = 1.85;
[
	Parallelogram([0 0], [1 0; 0.5 y]),
	Parallelogram([0 0], [1 0; -0.15 y]),
	Parallelogram([0 0], [1 0; 1.65 y])
].LineDrawing
~~~

![](sw/spl/Help/Image/Parallelogram-D.svg)

Any triangle is always of equal area to a certain parallelogram having an equal base and an altitude half as great as that of the triangle:

~~~spl svg=E
[
	Triangle([0 0; 1 0; 0.75 1.5]),
	Parallelogram([0 0], [1 0; 0.375 0.75])
].LineDrawing
~~~

![](sw/spl/Help/Image/Parallelogram-E.svg)

* * *

See also: LineDrawing, parallelogram, Polygon, vertexCoordinates

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Parallelogram.html)
[2](https://reference.wolfram.com/language/ref/Parallelogram.html),
_W_
[1](https://en.wikipedia.org/wiki/Parallelogram)
