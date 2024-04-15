# nextPermutationLexicographic

- _nextPermutationLexicographic(aSequence)_

Mutate _aSequence_ in place so that it holds the next permutation in lexicographic ordering.
Answer _aSequence_ if there is such a permutation,
or `nil` if the sequence is the final permutation.

```
>>> [1 2 3 4].nextPermutationLexicographic
[1 2 4 3]

>>> [2 4 3 1].nextPermutationLexicographic
[3 1 2 4]
```

If there are no further permutations answer nil:

```
>>> [4 3 2 1].nextPermutationLexicographic
nil
```

* * *

See also: lexicographicPermutations

References:
_W_
[1](https://en.wikipedia.org/wiki/Permutation#Generation_in_lexicographic_order)

Categories: Permutations
