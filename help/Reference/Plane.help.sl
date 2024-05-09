# Plane

- _Plane(a, b, c, d)_
- _Plane(p, q, r)_

The ternary form answers a `Plane` given three cartesian coordinates:

```
>>> Plane([1 1 1], [-1 1 0], [2 0 3])
Plane(-1, 3, 2, -4)

>>> Plane([1 -2 1], [4 -2 -2], [4 1 4])
Plane(1, -2, 1, -6)

>>> Plane([1 1 0], [1 0 1], [0 1 2])
Plane(2, 1, 1, -3)

>>> Plane([1 -2 0], [3 1 4], [0 -1 2])
Plane(2, -8, 5, -18)

>>> Plane([4 0 0], [0 5 0], [0 0 3])
Plane(15, 12, 20, -60)

>>> Plane([-1 1 2], [-4 2 2], [-2 1 5])
Plane(3, 9, 1, -8)

>>> Plane([1 2 3], [-2 1 0], [0 3 2])
Plane(1, 0, -1, 2)
```

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Plane.html)
