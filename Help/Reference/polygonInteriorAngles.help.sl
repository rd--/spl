# polygonInteriorAngles

- _polygonInteriorAngles(aSequence)_

Answer the interior angles of the polygon given by _aSequence_.
The angles are answered in the same sequence and begin at the same place as the coordinates.

Interior angles of a triangle:

```
>>> [0 0; 5 0; 3.2 2.4]
>>> .polygonInteriorAngles
[(4 / 5).arcCos, (3 / 5).arcCos, 1/2.pi]
```

C.f. `Polygon` and `interiorAngles`:

```
>>> [0 0; 5 0; 3.2 2.4].Polygon
>>> .interiorAngles
[(4 / 5).arcCos, (3 / 5).arcCos, 1/2.pi]
```

C.f. `Triangle`:

```
>>> Triangle([0 0], [5 0], [3.2 2.4])
>>> .interiorAngles
[(4 / 5).arcCos, (3 / 5).arcCos, 1/2.pi]
```

* * *

See also: interiorAngles, Polygon, Triangle
