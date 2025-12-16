# isSignatureMatrix

- _isSignatureMatrix(m)_

Answer `true` if the matrix _m_ is a signature matrix,
a diagonal matrix where the diagonal elements are plus or minus one.

At three 3×3 matrices:

```
>>> 3.identityMatrix
>>> .isSignatureMatrix
true

>>> [1 1 -1].diagonalMatrix
>>> .isSignatureMatrix
true

>>> [3 3].iota
>>> .isSignatureMatrix
false
```

* * *

See also: isDiagonalMatrix, isMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MatrixSignature.html),
_W_
[1](https://en.wikipedia.org/wiki/Signature_matrix)
