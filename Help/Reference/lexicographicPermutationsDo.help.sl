# lexicographicPermutationsDo

- _lexicographicPermutationsDo(c, f:/1)_

Apply the block _f_ to each permutation of the sequence _c_ in turn,
which must answer either `true` to continue,
or `false` to end,
the iteration.
Note: The value supplied to _f_ is _not_ a copy,
the same sequence is mutated in place.

Count the lexicographic permutations of _1234_:

```
>>> let n = 0;
>>> [1 2 3 4]
>>> .lexicographicPermutationsDo { :each |
>>> 	n := n + 1;
>>> 	true
>>> };
>>> n
24
```

* * *

See also: lexicographicPermutations, nthLexicographicPermutation

Guides: Iteration Functions, Permutation Functions
