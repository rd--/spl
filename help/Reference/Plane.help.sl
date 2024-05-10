# Plane

- _Plane(a, b, c, d)_
- _Plane(p, q, r)_

The quaternary form answers a `Plane` given the four terms of the equation
_(a * x) + (b * y) + (c * z) + d = 0_.
The ternary form answers a `Plane` given three cartesian coordinates.

The _x/y_ plane, with unit normal vector of _0 0 1_ and distance from origin of `zero`:

```
>>> let p = Plane(0, 0, 1, 0);
>>> (p.unitNormalVector, p.distance)
([0 0 1], 0)
```

The _x/y_, _x/z_ and _y/z_ planes:

```
>>> Plane([0 0 0], [1 0 0], [0 1 0])
Plane(0, 0, 1, 0)

>>> Plane([0 0 0], [1 0 0], [0 0 1])
Plane(0, 1, 0, 0)

>>> Plane([0 0 0], [0 1 0], [0 0 1])
Plane(1, 0, 0, 0)
```

Determine if points belongs to a given plane:

```
>>> let p = Plane([1 0 0], [1 0 1], [1 1 0]);
>>> [1 2 3; 0 2 3].collect { :each | p.includes(each) }
[true, false]
```

Specific planes,
where the terms are integers they are given in reduced form:

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

See also: hessianNormalForm, unitNormalVector

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Plane.html)
