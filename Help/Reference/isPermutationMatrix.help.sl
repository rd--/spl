# isPermutationMatrix

- _isPermutationMatrix(m)_

Answer `true` is _m_ is a permutation matrix.

The identity matrix is a permutation matrix:

```
>>> 7.identityMatrix
>>> .isPermutationMatrix
true
```

The all `ones` and all `zeroes` matrices are not:

```
>>> [7 7].ones.isPermutationMatrix
false

>>> [7 7].zeroes.isPermutationMatrix
false
```

`permutationMatrix` answers a permutation matrix:

```
>>> [1 3 5 4 2].permutationMatrix
>>> .isPermutationMatrix
true
```

* * *

See also: isCostasArray, permutationMatrix

Guides: Matrix Functions
