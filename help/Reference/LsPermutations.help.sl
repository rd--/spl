# LsPermutations

- _LsPermutations(aSequence)_

The permutations of _aSequence_ in lexicographic order.

All of _S3_:

```
>>> LsPermutations([1 2 3]).upToEnd
[1 2 3; 1 3 2; 2 1 3; 2 3 1; 3 1 2; 3 2 1]
```

The first five entries of _S4_:

```
>>> LsPermutations([1 2 3 4]).next(5)
[1 2 3 4; 1 2 4 3; 1 3 2 4; 1 3 4 2; 1 4 2 3]
```

* * *

See also: nextPermutationLexicographic
