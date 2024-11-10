# isPermutationCycles

- _isPermutationCycles(aSequence)_

Answer `true` if _aSequence_ contains a valid permutation in cyclic form, and `false` otherwise.

A valid permutation in cyclic form:

```
>>> [1 5 2; 4 10 20 3].isPermutationCycles
true
```

An invalid permutation in cyclic form:

```
>>> [1 1 2; 3 4].isPermutationCycles
false
```

The identity permutation:

```
>>> [].isPermutationCycles
true
```

Cycles must be disjoint:

```
>>> [1 2; 1 3].isPermutationCycles
false
```

Integers must be positive:

```
>>> [1 0; -2 3].isPermutationCycles
false
```

Numbers other than integers are not accepted:

```
>>> [1 2; 3 1/2].isPermutationCycles
false
```

The depth of the tree structure must be 3:

```
>>> [1 2:; 3 4].isPermutationCycles
false
```

* * *

See also: permutationCycles, permutationList, isPermutationList

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationCyclesQ.html)

Categories: Testing, Permutations
