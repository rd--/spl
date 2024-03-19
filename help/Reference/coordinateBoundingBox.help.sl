# coordinateBoundingBox

- _coordinateBoundingBox(aMatrix)_

Answer the corners of the bounding box of the region defined by _aMatrix_.

Find a bounding box for coordinates in 2 dimensions:

```
>>> [0 1; 1 2; 2 1; 3 2; 4 0].coordinateBoundingBox
[0 0; 4 2]

>>> [0 1; 1 2; 2 1; 3 2; 4 0].transposed.collect(minMax:/1).transposed
[0 0; 4 2]
```

`coordinateBoundingBox` is the `transposed` of `coordinateBounds`.

* * *

See also: coordinateBounds, minMax, transposed

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CoordinateBoundingBox.html)
