# permutationCyclesToPermutationList

- _permutationCyclesToPermutationList(aPermutation, anInteger)_

Answer the permutation list corresponding to the cycle notation at _aPermutation_.

```
>>> [1 3 5; 2; 4].permutationCyclesToPermutationList
[3 2 5 4 1]
```

In the unary case,
the `size` of the list is given by the `permutationDegree` of the _aPermutation_:

```
>>> [1 2 3; 9].permutationDegree
9

>>> [1 2 3; 9].permutationCyclesToPermutationList
[2 3 1 4 5 6 7 8 9]
```

The empty (identity) permutation:

```
>>> [].permutationCyclesToPermutationList
[]
```

The binary form allows setting the size of the answer:

```
>>> [].permutationCyclesToPermutationList(5)
[1 2 3 4 5]
```

* * *

See also: isPermutationCycles, Permutation, permutationCycles, permutationDegree, permutationList
