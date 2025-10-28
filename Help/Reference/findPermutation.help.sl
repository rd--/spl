# findPermutation

- _findPermutation(aSequence)_
- _findPermutation(aSequence, anotherSequence)_

Answer a permutation that converts _aSequence_ into _anotherSequence_,
for two sequences that differ only in the order of their arguments.

Permutation relating two expressions with the same elements:

```
>>> [1 3 4 5 2].findPermutation([3 1 2 4 5])
[1 2; 3 4 5].cycles
```

Verify the result using `permute`:

```
>>> [1 3 4 5 2].permute([1 2; 3 4 5])
[3 1 2 4 5]
```

Relation with `ordering`:

```
>>> 'adcghf'.characters.findPermutation
[2 3; 4 6 5].cycles

>>> 'adcghf'.characters.ordering.asPermutation
[2 3; 4 6 5].cycles

>>> let l = 'adcghf'.characters;
>>> l.sorted.findPermutation(l)
[2 3; 4 6 5].cycles
```

* * *

See also: cycles, ordering, Permutation, permute

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FindPermutation.html)

Categories: Permutations
