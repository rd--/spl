# area

- _area(aGeometry)_

Answer the area of _aGeometry_.

Find the area of a `Circle`:

```
>>> Circle([0 0], 1).area
1.pi
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
```

* * *

See also: arcLength, Circle, cross, Polygon, Rectangle, shoelaceFormula, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Area.html)
[2](https://reference.wolfram.com/language/ref/Area.html)

Categories: Accessing, Geometry
