# circlePoints

- _circlePoints(n, o, r, theta)_
- _circlePoints(alpha, beta)_ ⟹ _circlePoints(alpha, [0 0], beta, (1/alpha).pi - (1/2).pi)_

Answer the positions of _n_ points equally spaced around a circle of radius _r_ given initial angle _theta_.

Corners of an equilateral triangle:

```
>>> 3.circlePoints(1)
[
	[3.sqrt / 2, -1 / 2],
	[0, 1],
	[3.sqrt / -2, -1 / 2]
]
```

A square with side length two centered at _(0,0)_:

```
>>> 4.circlePoints(2.sqrt)
[1 -1; 1 1; -1 1; -1 -1]
```

Four unitary vectors aligned with the axes:

```
>>> 4.circlePoints([0 0], 1, 0)
[1 0; 0 1; -1 0; 0 -1]
```

C.f. `angleVector`:

```
>>> 6.circlePoints([0 0], 1, 0)
(0, 1/3.pi .. 2.pi)
.collect(angleVector:/1)
.allButLast
```

Draw a pentagon:

~~~spl svg=A
5.circlePoints([0 0], 1, 1.pi / 10)
.Polygon
~~~

![](sw/spl/Help/Image/circlePoints-A.svg)

Unit circles at each circle point:

~~~spl svg=B
20.circlePoints([0 0], 1, 0).collect { :p |
	Circle(p, 1)
}.LineDrawing
~~~

![](sw/spl/Help/Image/circlePoints-B.svg)

Three concentric complete graph drawings:

~~~spl svg=C
1:3.collect { :r |
	8.circlePoints([0 0], r * 100, 0)
	.tuples(2)
	.Line
}.LineDrawing
~~~

![](sw/spl/Help/Image/circlePoints-C.svg)

Connect every fifth point of twelve,
place circles within outer polgons:

~~~spl svg=D
let p = 12.circlePoints([0 0], 1, 0);
let i = [1 .. 12] * 5 % 12 + 1;
let q = 12.circlePoints([0 0], 9 / 17, 0);
[
	Circle([0 0], 1),
	Polygon(p @* i),
	q.collect { :each |
		Circle(each, 1 / 9)
	}
].LineDrawing
~~~

![](sw/spl/Help/Image/circlePoints-D.svg)

* * *

See also: %, ^, angleVector, Circle, cos, Range, sin

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CirclePoints.html)

Categories: Geometry
