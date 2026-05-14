# isDerangement

- _isDerangement(aPermutation)_

Answer whether _aPermutation_ is a derangement.

A permutation is a derangement if it has no fixed points.

```
>>> Permutation[2 3 1]
>>> .isDerangement
true
```

A permutation with fixed points:

```
>>> Permutation[1 4 2 3]
>>> .isDerangement
false
```

* * *

See also: derangements, Permutation

References:
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.is_derangement)

Categories: Testing, Permutation
