# permutationMax

- _permutationMax(aPermutation)_

Answer the largest integer moved by _aPermutation_.

The largest integer moved by a permutation is sometimes called its degree.
Another common definition of permutation degree is the number of integers moved.

Largest point moved by a permutation:

```
>>> [1 6 3; 2 5 12 9].cycles.permutationMax
12
```

Largest point moved in a permutation list:

```
>>> [1 4 3 10 2 6 5 7 9 8 11].asPermutation.permutationMax
10
```

Maximum of the support of the identity:

```
>>> [].cycles.permutationMax
0
```

* * *

See also: cycles, permutationLength, permutationMin, permutationSupport

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationMax.html)
