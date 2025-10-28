# asPolarCoordinates

- _asPolarCoordinates(c)_

Answer an instance of `PolarCoordinates` given a collection _c_..

`List` case:

```
>>> [1 2].asPolarCoordinates
PolarCoordinates([1 2])
```

`Record` case:

```
>>> (r: 1, theta: 2).asPolarCoordinates
PolarCoordinates([1 2])
```

In the `PolarCoordinates` cases answer `identity`:

```
>>> let p = PolarCoordinates([1 2]);
>>> p.asPolarCoordinates
p
```

* * *

See also: asCartesianCoordinates, asPoint, asPlanarCoordinates, PolarCoordinates, toPolarCoordinates

Guides: Geometry Functions

Categories: Converting
