# permutationCycle

- _permutationCycle(aSequence, anInteger)_

Answer the permutation cycle, or orbit, of the permutation list _aSequence_ beginning at _anInteger_.

Form `permutationCycles` by collecting each orbit separately:

```
>>> let l = [2 5 3 6 1 8 7 9 4 10];
>>> [1 3 4 7 10].collect { :i | l.permutationCycle(i) }
[1 2 5; 3; 4 6 8 9; 7; 10]

>>> [2 5 3 6 1 8 7 9 4 10].permutationCycles
[1 2 5; 3; 4 6 8 9; 7; 10]
```

* * *

See also: permutationCycles

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PermutationCycle.html)

Categories: Permutations
