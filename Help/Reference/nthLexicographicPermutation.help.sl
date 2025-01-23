# nthLexicographicPermutation

- _nthLexicographicPermutation(aSequence, anInteger)_

Answer the _anInteger_-th lexicographic permutation of _aSequence_.

The ninth lexicographic permutation of _1234_:

```
>>> [1 2 3 4]
>>> .nthLexicographicPermutation(9)
[2 3 1 4]

>>> [1 2 3 4]
>>> .lexicographicPermutations
>>> .at(9)
[2 3 1 4]
```

The 3333rd lexicographic permutation of _123456789_:

```
>>> [1 .. 9].nthLexicographicPermutation(3333)
[1 2 7 6 8 9 4 3 5]
```

* * *

See also: lexicographicPermutations, lexicographicPermutationsDo
