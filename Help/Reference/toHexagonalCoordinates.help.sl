# toHexagonalCoordinates

- _toHexagonalCoordinates([x y])_

Convert from a duple _(x,y)_ in the Cartesian coordinate system,
to a triple _(q,r,s)_ in the cubical hexagonal coordinate system.

Convert integeral Cartesian coordinates to real hexagonal coordinates:

```
>>> [1 1].toHexagonalCoordinates
[0.2440 0.6666 -0.9107]
```

Convert Cartesian coordinates to integral hexagonal coordinates:

```
>>> [1.5 * 3.sqrt, 1.5].toHexagonalCoordinates
[1 1 -2]
```

The inverse is `fromHexagonalCoordinates`:

```
>>> [1 1]
>>> .toHexagonalCoordinates
>>> .fromHexagonalCoordinates
[1 1]
```

* * *

See also: fromHexagonalCoordinates, HexagonalCoordinates

Guides: Coordinate System Functions
