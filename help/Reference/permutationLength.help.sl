# permutationLength

- _permutationLength(aPermutation)_

Answer the number of integers moved by _aPermutation_.

Number of points moved by a permutation:

```
>>> [1 7 3 5; 2 12 9].cycles.permutationLength
7
```

Number of points moved in a permutation list:

```
>>> [2 4 3 8 1 6 5 7 9 10 11].asPermutation.permutationLength
6
```

Lengthimum of the support of the identity:

```
>>> [].cycles.permutationLength
0
```

* * *

See also: cycles, permutationMax, permutationMin, permutationSupport

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationLength.html)

Categories: Permutations
