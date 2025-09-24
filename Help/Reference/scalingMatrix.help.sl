# scalingMatrix

- _scalingMatrix([x₁ x₂ …])_

Answer the matrix corresponding to scaling along each coordinate axis.

```
>>> [1 2 3].scalingMatrix
[1 0 0; 0 2 0; 0 0 3]
```

Scaling factors can be negative or zero:

```
>>> [1 1 -1].scalingMatrix
[1 0 0; 0 1 0; 0 0 -1]

>>> [1 1 0].scalingMatrix
[1 0 0; 0 1 0; 0 0 0]
```

`scalingMatrix` is an alias for `diagonalMatrix`.

* * *

See also: diagonalMatrix, identityMatrix, reflectionMatrix, rotationMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ScalingMatrix.html)

Categories: Geometry, Matrix
