# unitNormal

- _unitNormal(aSurface)_

Answer the unit normal vector of _aSurface_.

The unit normal of the _x/y_ infinite plane:

```
>>> InfinitePlane([0 0 0], [1 0 0], [0 1 0])
>>> .unitNormal
[0 0 1]
```

The nearest point on a plane:

```
>>> let r = InfinitePlane([0 0 0], [1 0 0], [0 3 1]);
>>> let p = [1 2 3];
>>> p - (r.unitNormal * r.distance(p))
[1 2.7 0.9]
```

At `Triangle`:

```
>>> Triangle([1 1 1], [1 -1 1], [1 0 -1])
>>> .unitNormal
[1 0 0]

>>> Triangle([0 0 1], [1 0 0], [0 1 0])
>>> .unitNormal
[0.5774 0.5774 0.5774]

>>> Triangle([0 0 1], [0 1 0], [1 0 0])
>>> .unitNormal
[-0.5774 -0.5774 -0.5774]

>>> Triangle([0 0 0], [2 0 0], [0 2 0])
>>> .unitNormal
[0 0 1]
```

* * *

See also: InfinitePlane, normalize, surfaceNormal, Triangle, unitVector

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NormalVector.html)
[2](https://mathworld.wolfram.com/UnitVector.html),
_W_
[1](https://en.wikipedia.org/wiki/Normal_(geometry))

Categories: Geometry
