# eulerMatrix

- _eulerMatrix([alpha, beta, gamma])_

Answer the Euler rotation matrix formed by rotating by _α_ around the _z_-axis,
then by β around the _y_-axis,
and then by γ around the current _z_-axis.

Rotate a vector:

```
>>> let m = [3/4.pi, 1/3.pi, 1/3.pi].eulerMatrix;
>>> let v = [1 0 0];
>>> m.dot(v)
[
	0 - (3/2.sqrt / 2) - (1 / (4 * 2.sqrt)),
	0 - (3/2.sqrt / 2) + (1 / (4 * 2.sqrt)),
	0 - (3.sqrt / 4)
]
```

`eulerMatrix` corresponds to three rotations:

```
>>> let [a, b, c] = [3/4.pi, 1/3.pi, 1/3.pi];
>>> let p = a.rotationMatrix([0, 0, 1]);
>>> let q = b.rotationMatrix([0, 1, 0]);
>>> let r = c.rotationMatrix([0, 0, 1]);
>>> p.dot(q).dot(r)
[a, b, c].eulerMatrix
```

* * *

See also: rotationMatrix

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EulerAngles.html)
[2](https://mathworld.wolfram.com/RotationMatrix.html)
[3](https://reference.wolfram.com/language/ref/EulerMatrix.html)

Categories: Geometry, Matrix
