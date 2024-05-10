# asPolarCoordinate

- _asPolarCoordinate(aSequence | aDictionary)_

Answer a `PolarCoordinate`.

`List` case:

```
>>> [1, 2].asPolarCoordinate
PolarCoordinate(1, 2)
```

`Tuple` case:

```
>>> (1, 2).asPolarCoordinate
PolarCoordinate(1, 2)
```

`Record` case:

```
>>> (r: 1, theta: 2).asPolarCoordinate
PolarCoordinate(1, 2)
```

In the `PolarCoordinate` cases answer `identity`:

```
>>> let p = PolarCoordinate(1, 2);
>>> p.asPolarCoordinate
p
```

* * *

See also: asCartesianCoordinate, asPoint, asRectangularCoordinate, PolarCoordinate, toPolarCoordinates

Guides: Geometry Types

Categories: Converting
