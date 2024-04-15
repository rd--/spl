# fixedPoints

- _fixedPoints(aPermutation, anInteger)_

Answer a `List` of the fixed points of _aPermutation_ up to _anInteger_.

```
>>> let p = [1 3 2 4].asPermutation;
>>> (p.support, p.fixedPoints(4))
([2 3], [1 4])
```

The fixed points of the identity permutation:

```
>>> let p = 1:4.asPermutation;
>>> p.fixedPoints(4)
[1 2 3 4]
```

* * *

See also: Permutation

References:
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.fixed_points)
