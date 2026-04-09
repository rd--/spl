# isPerfectCube

- _isPerfectCube(n)_

Answer `true` if _n_ is a perfect cube.
A perfect cube is a number which is the cube of an integer.

Select perfect cubes,
OEIS [A000578](https://oeis.org/A000578):

```
>>> 0:99.select(isPerfectCube:/1)
[0 1 8 27 64]

>>> [0 1 8 27 64].cubeRoot
[0 1 2 3 4]

>>> [0 1 8 27 64] ^ (1 / 3)
[0 1 2 3 4]
```

* * *

See also: ^, cubeRoot, isPerfectSquare, power

Guides: Integer Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Cube_(algebra))
