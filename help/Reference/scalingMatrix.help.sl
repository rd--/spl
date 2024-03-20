# scalingMatrix

_scalingMatrix(aList)_

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

_scalingMatrix_ is an alias for _diagonalMatrix_.

* * *

See also: identityMatrix, diagonalMatrix

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ScalingMatrix.html)
