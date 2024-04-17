# permutationRank

- _permutationRank(aPermutation)_

Answer the zero-based index of _aPermutation_ in the lexicographic ordering of the symmetric group to which it belongs.

```
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
