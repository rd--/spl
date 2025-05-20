# arcLength

- _arcLength(aCurve)_

Answer the length of _aCurve_.

At `Circle`:

```
>>> Circle([0 0], 1).arcLength
2.pi
```

At `Line`:

```
>>> Line([0 0; 1 1; 2 0]).arcLength
2.sqrt * 2
```

At `Triangle`:

```
>>> Triangle([0 0], [1 0], [0 1]).arcLength
(2 + 2.sqrt)
```

At `Rectangle`:

```
>>> Rectangle([-1 -1], [1 1]).arcLength
8
```

At `Polygon`:

```
>>> 5.regularPolygon([0 0], 1, 0).arcLength
5.8779
```

* * *

See also: Circle, circumference, perimeter, Line, Polygon, Rectangle, regularPolygon

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ArcLength.html)
[2](https://reference.wolfram.com/language/ref/ArcLength.html)

Categories: Geometry
