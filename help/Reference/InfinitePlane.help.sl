# InfinitePlane

- _InfinitePlane(a, b, c, d)_
- _InfinitePlane(p, q, r)_

The quaternary form answers an `InfinitePlane` given the four terms of the equation
_(a * x) + (b * y) + (c * z) + d = 0_.
The ternary form answers an `InfinitePlane` given three cartesian coordinates.

The _x/y_ plane, with unit normal vector of _0 0 1_ and distance from origin of `zero`:

```
>>> let p = InfinitePlane(0, 0, 1, 0);
>>> (p.unitNormal, p.distance)
([0 0 1], 0)
```

The _x/y_, _x/z_ and _y/z_ planes:

```
>>> InfinitePlane([0 0 0], [1 0 0], [0 1 0])
InfinitePlane(0, 0, 1, 0)

>>> InfinitePlane([0 0 0], [1 0 0], [0 0 1])
InfinitePlane(0, 1, 0, 0)

>>> InfinitePlane([0 0 0], [0 1 0], [0 0 1])
InfinitePlane(1, 0, 0, 0)
```

Determine if points belongs to a given plane:

```
>>> let p = InfinitePlane([1 0 0], [1 0 1], [1 1 0]);
>>> [1 2 3; 0 2 3].collect { :each | p.includes(each) }
[true, false]
```

Specific planes,
where the terms are integers they are given in reduced form:

```
>>> InfinitePlane([1 1 1], [-1 1 0], [2 0 3])
InfinitePlane(-1, 3, 2, -4)

>>> InfinitePlane([1 -2 1], [4 -2 -2], [4 1 4])
InfinitePlane(1, -2, 1, -6)

>>> InfinitePlane([1 1 0], [1 0 1], [0 1 2])
InfinitePlane(2, 1, 1, -3)

>>> InfinitePlane([1 -2 0], [3 1 4], [0 -1 2])
InfinitePlane(2, -8, 5, -18)

>>> InfinitePlane([4 0 0], [0 5 0], [0 0 3])
InfinitePlane(15, 12, 20, -60)

>>> InfinitePlane([-1 1 2], [-4 2 2], [-2 1 5])
InfinitePlane(3, 9, 1, -8)

>>> InfinitePlane([1 2 3], [-2 1 0], [0 3 2])
InfinitePlane(1, 0, -1, 2)
```

* * *

See also: HalfPlane, hessianNormalForm, unitNormal

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Plane.html)
[1](https://reference.wolfram.com/language/ref/InfinitePlane.html)

Categories: Geometry
