# area

- _area(g)_

Answer the area of the geometry _g_.

Find the area of a `Circle`:

```
>>> Circle([0 0], 1).area
1.pi
```

Find the area of a `Sphere`:

```
>>> Sphere([0 0 0], 1).area
4.pi
```

Find the area of a `Triangle`:

```
>>> Triangle([0 0], [1 0], [0 1]).area
1/2

>>> let t = Triangle([0 1], [1 0], [0 0]);
>>> (t.area, t.signedArea)
(1/2, -1/2)
```

Find the area of a `Rectangle`:

```
>>> Rectangle([-1 -1], [1 1]).area
4
```

Find the area of a `Polygon`:

```
>>> Polygon([1 0; 0 3.sqrt; -1 0]).area
3.sqrt

>>> Polygon([0 0; 2 -1; 1 0; 2 1]).area
1
```

Find the area of a `GeometryCollection`,
in this case of polygons:

```
>>> let c = [0 0; 1 0 ; 0 1];
>>> [c, c + 1].polygonCollection.area
1
```

Find area of a parallelogram:

```
>>> [0 0].parallelogram([2 0; 1 2]).area
4
```

* * *

See also: arcLength, Circle, cross, perimeter, Polygon, Rectangle, shoelaceFormula, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Area.html)
[2](https://reference.wolfram.com/language/ref/Area.html),
_W_
[1](https://en.wikipedia.org/wiki/Area)

Categories: Accessing, Geometry
