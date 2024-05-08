# asRectangularCoordinate

- _asRectangularCoordinate(aList | aRecord | aTuple)_

Answer a `RectangularCoordinate`.

`List` case:

```
>>> [1, 2].asRectangularCoordinate
RectangularCoordinate(1, 2)
```

`Tuple` case:

```
>>> (1, 2).asRectangularCoordinate
RectangularCoordinate(1, 2)
```

`Record` case:

```
>>> (x: 1, y: 2).asRectangularCoordinate
RectangularCoordinate(1, 2)
```

In the `RectangularCoordinate` cases answer `identity`:

```
>>> let p = RectangularCoordinate(1, 2);
>>> p.asRectangularCoordinate
p
```

* * *

See also: asComplex, CartesianCoordinate, Point, RectangularCoordinate

Guides: Geometry Types

Categories: Converting
