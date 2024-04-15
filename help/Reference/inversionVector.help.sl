# inversionVector

- _inversionVector(aPermutation)_

Answer the inversion vector of _aPermutation_.

The inversion vector of a permutation indicates for each place the number of elements larger than it that appear to its left.

```
>>> [5 9 1 8 2 6 4 7 3].inversionVector
[2 3 6 4 0 2 2 1 0]

>>> [8 7 2 1 9 4 6 5 10 3].inversionVector
[3 2 7 3 4 3 1 0 0 0]

>>> [3 2 4 1 5].inversionVector
[3 1 0 0 0]
```

* * *

See also: Permutation, permutationSymbol

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InversionVector.html),
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.to_inversion_vector)

Categories: Permutations, Type
