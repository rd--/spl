# isDerangement

- _isDerangement(p)_

Answer whether the permutation _p_ is a derangement.

A permutation is a derangement if it has no fixed points,
or equally if the `size` of the `support` is equal to the `degree` of the permutation.

```
>>> let p = Permutation[2 3 1];
>>> (p.isDerangement, p.support)
(true, [1 2 3])
```

A permutation with fixed points:

```
>>> let p = Permutation[1 4 2 3];
>>> (p.isDerangement, p.completeCycles)
(false, [1; 2 4 3])
```

Count derangements:

```
>>> [1 .. 5].permutations
>>> .count(isDerangement:/1)

>>> 5.subfactorial
44
```

* * *

See also: derangements, Permutation, subfactorial

References:
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.is_derangement)

Categories: Testing, Permutation
