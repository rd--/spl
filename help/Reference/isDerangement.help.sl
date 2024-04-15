# isDerangement

- _isDerangement(aPermutation)_

Answer whether _aPermutation_ is a derangement.

A permutation is a derangement if it has no fixed points.

A permutation with fixed points:

```
>>> let p = [1 4 2 3].asPermutation;
>>> p.isDerangement
false

>>> let p = [2 3 1].asPermutation;
>>> p.isDerangement
true
```

* * *

See also: derangements, Permutation

References:
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.is_derangement)
