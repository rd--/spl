# permutationCycles

- _permutationCycles(aPermutation | aSequence)_

Answer a disjoint cycle representation of _aPermutation_,
or of the permutation list _aSequence_.

Cyclic form of a permutation list of length 3:

```
>>> [3 2 1].permutationCycles
[1 3; 2]
```

Cyclic form of a permutation list of length 10:

```
>>> [2 5 3 6 1 8 7 9 4 10].permutationCycles
[1 2 5; 3; 4 6 8 9; 7; 10]
```

Identity permutation list:

```
>>> 1:5.permutationCycles
[1; 2; 3; 4; 5]
```

Cyclic form of a permutation list of length 6:

```
>>> [6 3 2 5 4 1].permutationCycles
[1 6; 2 3; 4 5]
```

Permutation cycles with unary cycles deleted can be considered a sparse representation of permutation lists:

```
>>> let l = [2 3 1 4 5 6 7 8 9 10 12 11 13 14 15 16 17 18 19 20];
>>> let c = l.permutationCycles;
>>> c.reject { :each | each.size = 1 }
[1 2 3; 11 12]
```

Histogram of the cycle count for the permutations of the symmetric group _S6_:

```
>>> let p = 1:6.permutations;
>>> let k = p.collect { :each | each.permutationCycles.size };
>>> k.asBag.sortedElements
[1 -> 120, 2 -> 274, 3 -> 225, 4 -> 85, 5 -> 15, 6 -> 1]
```

* * *

See also: isPermutationCycles, isPermutationList, permutationList, permutationMatrix

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationCycles.html)
