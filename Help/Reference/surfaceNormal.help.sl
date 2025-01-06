# surfaceNormal

- _surfaceNormal(aSurface)_

Answer the normal vector of _aSurface_.

At `Triangle`:

```
>>> Triangle([0 0 1], [1 0 0], [0 1 0])
>>> .surfaceNormal
[1 1 1]

>>> Triangle([0 0 1], [0 1 0], [1 0 0])
>>> .surfaceNormal
[-1 -1 -1]

>>> Triangle([0 0 0], [2 0 0], [0 2 0])
>>> .surfaceNormal
[0 0 4]
```

At `InfinitePlane`:

```
>>> InfinitePlane([0 0 0], [2 0 0], [0 2 0])
>>> .surfaceNormal
[0 0 1]
```

* * *

See also: InfinitePlane, normalize, Triangle, unitNormal, unitVector

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NormalVector.html),
_W_
[1](https://en.wikipedia.org/wiki/Normal_(geometry))

Categories: Geometry
