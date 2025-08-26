# scale

- _scale(g, s)_

Scale the geometry _g_ by a factor _s_ retaining the center coordinate.

At `Circle`:

```
>>> Circle([1 0], 1).scale(2)
Circle([1 0], 2)
```

At `Rectangle`:

```
>>> let a = Rectangle([0 0], [2 1]);
>>> let b = a.scale(2);
>>> (a.center, b, b.center)
(
	[1 0.5],
	Rectangle([-1, -0.5], [3, 1.5]),
	[1 0.5]
)
```

At `Polygon`:

```
>>> let a = 5.regularPolygon([1 3], 1, 0);
>>> let b = a.scale(2);
>>> (a.centroid, a.area, b.centroid, b.area)
([1 3], 2.3776, [1 3], 9.5106)
```

Nested circles:

~~~spl svg=A
{ :c |
	c.scale(1.goldenRatio)
}.nestList(Circle([0 0], 1), 4)
.LineDrawing
~~~

![](sw/spl/Help/Image/scale-A.svg)

Nested rectangles:

~~~spl svg=B
let phi = 1.goldenRatio;
{ :c |
	c.scale(phi)
}.nestList(Rectangle([0 0], [1 phi]), 4)
.LineDrawing
~~~

![](sw/spl/Help/Image/scale-B.svg)

Nested polygons:

~~~spl svg=C
{ :c |
	c.scale(1.goldenRatio)
}.nestList(5.regularPolygon([1 3], 1, 0), 4)
.LineDrawing
~~~

![](sw/spl/Help/Image/scale-C.svg)

* * *

See also: rotate, translate

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Scale.html)
