# lexicographicPermutationsDo

- _lexicographicPermutationsDo(aSequence, aBlock:/1)_

Apply _aBlock_ to each permutation of _aSequence_ in turn,
which must answer either `true` to continue,
or `false` to end,
the iteration.
Note: the value supplied to _aBlock_ is _not_ a copy,
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
