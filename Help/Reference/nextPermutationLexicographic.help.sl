# nextPermutationLexicographic!

- _nextPermutationLexicographic!(c)_

Mutate the sequence _c_ in-place so that it holds the next permutation in lexicographic ordering.
Answer _c_,
if there is such a permutation,
or `nil` if the sequence is the final permutation.

```
>>> [1 2 3 4].nextPermutationLexicographic!
[1 2 4 3]

>>> [2 4 3 1].nextPermutationLexicographic!
[3 1 2 4]
```

If there are no further permutations answer nil:

```
>>> [4 3 2 1].nextPermutationLexicographic!
nil
```

* * *

See also: lexicographicPermutations

Guides: Permutation Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Permutation#Generation_in_lexicographic_order)

Categories: Permutations
