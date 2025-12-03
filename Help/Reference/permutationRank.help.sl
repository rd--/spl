# permutationRank

- _permutationRank(p)_

Answer the zero-based index of the permutation _p_ in the lexicographic ordering of the symmetric group to which it belongs.

```
>>> [4 2 3 1].permutationRank
21

>>> [3 1 2 4].permutationRank
12

>>> let s4 = [1 .. 4].lexicographicPermutations;
>>> s4.collect(permutationRank:/1)
[0 .. 23]
```

The inverse is `unrankPermutation`:

```
>>> [0 .. 23].collect { :each |
>>> 	each.unrankPermutation(4).list
>>> }
[1 .. 4].lexicographicPermutations
```

* * *

See also: Permutation, unrankPermutation

Guides: Permutation Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/acapdot)
