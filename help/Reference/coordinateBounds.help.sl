# coordinateBounds

- _coordinateBounds(aMatrix)_

Answer a `List` of the bounds in each dimension of the region defined by _aMatrix_.

Find bounds for coordinates in 2 dimensions:

```
>>> [0 1; 1 2; 2 1; 3 2; 4 0].coordinateBounds
[0 4; 0 2]

>>> [0 1; 1 2; 2 1; 3 2; 4 0].transposed.collect(minMax:/1)
[0 4; 0 2]
```

* * *

See also: coordinateBoundingBox, minMax, transposed

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CoordinateBounds.html)

Categories: Array, Geometry
