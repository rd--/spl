# permutationMin

- _permutationMin(aPermutation)_

Answer the smallest integer moved by _aPermutation_.

Smallest point moved by a permutation:

```
>>> [3 4 6; 2 7].cycles.permutationMin
2
```

Smallest point moved in a permutation list:

```
>>> [1 2 5 4 3 6 7 8].asPermutation.permutationMin
3
```

Minimum of the support of the identity:

```
>>> [].cycles.permutationMin
inf
```

* * *

See also: cycles, permutationLength, permutationMax, permutationSupport

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationMin.html)
