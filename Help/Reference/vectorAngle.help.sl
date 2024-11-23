# vectorAngle

- _vectorAngle(u, v)_

Answers the angle between the vectors _u_ and _v_.

The angle between two vectors in two-dimensions:

```
>>> [1 0].vectorAngle([1 1])
(pi / 4)
```

The angle between two vectors in three-dimensions:

```
>>> [1 0 0].vectorAngle([1 1 1])
(1 / 3.sqrt).arcCos

>>> let u = [1 2 3];
>>> let v = [1 1 1];
>>> u.vectorAngle(v)
(6 / 7).sqrt.arcCos
```

The angle between orthogonal vectors:

```
>>> [1 0].vectorAngle([0 1])
0.5.pi

>>> [1 0 1].vectorAngle([0 1 0])
0.5.pi

>>> 10.unitVector(1).vectorAngle(10.unitVector(2))
0.5.pi
```

The angle between a vector and a vector on the same line:

```
>>> [1 1].vectorAngle([2 2])
0
```

* * *

See also: arcCos, cross, degree, dot, planarAngle

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/VectorAngle.html)

Categories: Geometry
