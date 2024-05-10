# asRectangularCoordinates

- _asRectangularCoordinates(aList | aRecord | aTuple)_

Answer a `RectangularCoordinates`.

`List` case:

```
>>> [1, 2].asRectangularCoordinates
RectangularCoordinates(1, 2)
```

`Tuple` case:

```
>>> (1, 2).asRectangularCoordinates
RectangularCoordinates(1, 2)
```

`Record` case:

```
>>> (x: 1, y: 2).asRectangularCoordinates
RectangularCoordinates(1, 2)
```

In the `RectangularCoordinates` cases answer `identity`:

```
>>> let p = RectangularCoordinates(1, 2);
>>> p.asRectangularCoordinates
p
```

* * *

See also: asComplex, CartesianCoordinates, Point, RectangularCoordinates

Guides: Geometry Types

Categories: Converting
