# isInvolution

- _isInvolution(aPemutation)_

An involution is a permutation which does not contain any cycles of length > 2,
i.e. it consists exclusively of fixed points and transpositions.

```
>>> [1 2; 3 4].cycles.isInvolution
true

>>> [1 2 3; 4].cycles.isInvolution
false
```

The permutation matrices of an involution are symmetric:

```
>>> let p = [1 2; 3 4].cycles;
>>> let m = p.permutationMatrix(4);
>>> m.isSymmetricMatrix
true
```

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PermutationInvolution.html)
