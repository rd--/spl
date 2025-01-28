# rotationMatrix

- _rotationMatrix(theta, aVector)_

Answers the 2×2 rotation matrix that rotates vectors counterclockwise by _theta_ radians.

Counterclockwise rotation by 30°:

```
>>> 1/6.pi.rotationMatrix
[
	[3.sqrt / 2, -1 / 2],
	[1 / 2, 3.sqrt / 2]
]
```

Rotation around the _z_-axis:

```
>>> let theta = 1/6.pi;
>>> theta.rotationMatrix([0 0 1])
[
	[theta.cos, theta.sin.-, 0],
	[theta.sin, theta.cos,   0],
	[0,     0,       1]
]
```

Rotate _(1,0,0)_ 90 degrees about the _z_-axis:

```
>>> let m = 1/2.pi.rotationMatrix([0 0 1]);
>>> m.dot([1 0 0])
[0 1 0]
```

The angle can be recovered from the matrix using `trace` and `arcCos`:

```
>>> let theta = 1/7.pi;
>>> let m = theta.rotationMatrix([0 0 1]);
>>> ((m.trace - 1) / 2).arcCos
theta
```

Rotation matrix about _x_-axis:

```
>>> let theta = 30.degree;
>>> theta.rotationMatrix([1 0 0])
[
	[1, 0, 0],
	[0, theta.cos, 0 - theta.sin],
	[0, theta.sin, theta.cos]
]
```

* * *

See also: dot, eulerMatrix, reflectionMatrix, scalingMatrix, sin, unitVector

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RotationMatrix.html)
[2](https://reference.wolfram.com/language/ref/RotationMatrix.html),
_W_
[1](https://en.wikipedia.org/wiki/Rotation_matrix)

Categories: Geometry, Matrix
