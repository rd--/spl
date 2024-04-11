# isPermutationCycles

- _isPermutationCycles(aSequence)_

Answer `true` if _aSequence_ contains a valid permutation in cyclic form, and `false` otherwise.

A valid permutation in cyclic form:

```
>>> [1 5 2; 4 10 20 3].isPermutationCycles
true
```

A invalid permutation in cyclic form:

```
>>> [1 1 2; 3 4].isPermutationCycles
false
```

The identity permutation:

```
>>> [].isPermutationCycles
true
```

* * *

See also: permutationCycles, permutationList, isPermutationList

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationCyclesQ.html)
