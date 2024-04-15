# inversionVector

- _inversionVector(aPermutation)_

Answer the inversion vector of _aPermutation_.

The inversion vector of a permutation is indicates for each place the number of elements larger than it that appear to its left.

```
>>> let p = [5 9 1 8 2 6 4 7 3].asPermutation;
>>> p.inversionVector(9)
[2 3 6 4 0 2 2 1 0]

>>> let p = [8 7 2 1 9 4 6 5 10 3].asPermutation;
>>> p.inversionVector(10)
[3 2 7 3 4 3 1 0 0 0]

>>> let p = [3 2 4 1 5].asPermutation;
>>> p.inversionVector(5)
[3 1 0 0 0]
```

* * *

See also: Permutation

References:
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.to_inversion_vector)
