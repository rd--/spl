# Circle

- _Circle(center, radius)_

A `Type` that represents a circle of _radius_ at _center_.

```
>>> let c = Circle([0 0], 1);
>>> (c.isCircle, c.center, c.radius)
(true, [0 0], 1)
```

Implements `x` and `y` to access components of `center`:

```
>>> let c = Circle([0 0], 1);
>>> (c.x, c.y)
(0, 0)
```

Calculate `arcLength`, `area`, `circumference`, `perimeter`, `centroid`, `diameter` and `radius`:

```
>>> let c = Circle([0 0], 1);
>>> (
>>> 	c.arcLength,
>>> 	c.area,
>>> 	c.circumference,
>>> 	c.perimeter,
>>> 	c.centroid,
>>> 	c.center,
>>> 	c.diameter,
>>> 	c.radius
>>> )
(2.pi, 1.pi, 2.pi, 2.pi, [0 0], [0 0], 2, 1)
```

The Svg description of a circle:

```
>>> Circle([0 0], 1).forSvg(precision: 0)
'<circle cx="0" cy="0" r="1" />'
```

Circles can be elements of `LineDrawing`s.
Specify radii:

~~~spl svg=A
Circle([0 0; 0 0; 0 0], [1 3 5])
.LineDrawing
~~~

![](sw/spl/Help/Image/Circle-A.svg)

Specify centers:

~~~spl svg=B
Circle([0 0; 1 1; 2 2], 1).LineDrawing
~~~

![](sw/spl/Help/Image/Circle-B.svg)

The _Seed of Life_:

~~~spl svg=C
[
	Circle([0 0], 1),
	{ :i |
		let x = (2.pi * i / 6);
		Circle([x.cos x.sin], 1)
	}.table(1:6)
].LineDrawing
~~~

![](sw/spl/Help/Image/Circle-C.svg)

The square packing of circles:

~~~spl svg=D
{ :i :j |
	Circle([i j], 0.5)
}.table(1:7, 1:5).LineDrawing
~~~

![](sw/spl/Help/Image/Circle-D.svg)

The hexagonal packing of circles:

~~~spl svg=E
{ :i :j |
	Circle(
		[
			i + ((-1 ^ j + 1) / 4),
			3.sqrt / 2 * j
		],
		0.5
	)
}.table(1:7, 1:5).LineDrawing
~~~

![](sw/spl/Help/Image/Circle-E.svg)

* * *

See also: arcLength, area, centroid, LineDrawing, perimeter, Polygon, Rectangle, r, Triangle, unitCircle, x, y

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Circle.html)
[2](https://reference.wolfram.com/language/ref/Circle.html)

Categories: Geometry
