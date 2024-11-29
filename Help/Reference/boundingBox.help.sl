# boundingBox

- _boundingBox(anObject)_

At `Point`:

```
>>> Point([0, 0]).boundingBox
[0 0; 0 0]
```

At `Circle`:

```
>>> Circle([0, 0], 1).boundingBox
[-1 -1; 1 1]
```

At `Line`:

```
>>> Line([0 0; 1 1; 2 0]).boundingBox
[0 0; 2 1]
```

At `Polygon`:

```
>>> [1 6; 3 1; 7 2; 4 4; 8 5].Polygon.boundingBox
[1 1; 8 6]
```

At `Triangle`:

```
>>> Triangle([0 0], [2 0], [1 3]).boundingBox
[0 0; 2 3]
```

* * *

See also: coordinateBoundingBox, Point, Circle, Line, Polygon, Triangle

Categories: Geometry
