# polygonInteriorAngles

- _polygonInteriorAngles(aSequence)_

Answer the interior angles of the polygon given by _aSequence_.
The angles are answered in the same sequence and begin at the same place as the coordinates.

Interior angles of a triangle:

```
>>> [0 0; 5 0; 3.2 2.4]
>>> .polygonInteriorAngles
[(4 / 5).arcCos, (3 / 5).arcCos, pi / 2]
```

C.f. `Polygon` and `interiorAngles`:

```
>>> [0 0; 5 0; 3.2 2.4].Polygon
>>> .interiorAngles
[(4 / 5).arcCos, (3 / 5).arcCos, pi / 2]
```

C.f. `Triangle`:

```
>>> Triangle([0 0], [5 0], [3.2 2.4])
>>> .interiorAngles
[(4 / 5).arcCos, (3 / 5).arcCos, pi / 2]
```

* * *

See also: interiorAngles, Polygon, Triangle
