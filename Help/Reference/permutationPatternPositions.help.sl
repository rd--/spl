# permutationPatternPositions

- _permutationPatternPositions(aPermutation, pattern)_

Answer the list of places where the _pattern_ appears in _aPermutation_.

_351462_ has three occurences of _132_:

```
>>> [3 5 1 4 6 2].permutationPatternPositions([1 3 2])
[1 2 4; 3 4 6; 3 5 6]
```

_32415_ has five copied of _213_:

```
>>> [3 2 4 1 5].permutationPatternPositions([2 1 3])
[1 2 3; 1 2 5; 1 4 5; 2 4 5; 3 4 5]
```

_51342_ has no instances of _213_, i.e. it avoids _213_:

```
>>> [5 1 3 4 2].permutationPatternPositions([2 1 3])
[]
```

* * *

See also: permutationHasPattern, reducedPermutation

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PermutationPattern.html),
_W_
[1](https://en.wikipedia.org/wiki/Permutation_pattern)
