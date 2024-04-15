# permutationOrder

- _permutationOrder(aPermutation)_

Answer the order of _aPermutation_.

The order of a permutation _p_ is the smallest positive integer _m_ such that the product of the permutation _p_ with itself _m_ times yields the identity permutation.

The only permutation with order 1 is the identity permutation:

```
>>> [].permutationOrder
1
```

Find the order of a permutation:

```
>>> [2 3 5; 1 6 7 4 10; 8 9].permutationOrder
30
```

Group elements with order 2 are called involutions.
If all elements of a group (except the identity) have order 2, then the group is Abelian (the opposite implication does not hold).
This group is Abelian:

```
>>> [3 4:; 1 2:; 1 2; 3 4].collect(permutationOrder:/1)
[2 2 2]
```

The order of a permutation can be computed as the least common multiple of the lengths of its cycles:

```
>>> [2 3 5; 1 6 7 4 10; 8 9].permutationOrder
30

>>> [3 5 2].lcm
30
```

* * *

See also: cycles, inversePermutation, permutationOrderList, permutationPower, permutationProduct

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationOrder.html)

Categories: Permutations
