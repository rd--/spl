# permutationFixedPoints

- _permutationFixedPoints(aPermutation)_

Answer a `List` of the fixed points of _aPermutation_.

```
>>> [1 3 2 4].permutationFixedPoints
[1 4]
```

The fixed points are the `complement` of the support:

```
>>> [1 3 2 4].permutationSupport
[2 3]
```

The fixed points of the identity permutation:

```
>>> [1 2 3 4].permutationFixedPoints
[1 2 3 4]
```

* * *

See also: Permutation

References:
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.fixed_points)
