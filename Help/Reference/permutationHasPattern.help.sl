# permutationHasPattern

- _permutationHasPattern(aPermutation, pattern)_

Answer `true` if _aPermutation_ includes _pattern_.

```
>>> [6 2 5 4 3 1].permutationHasPattern([4 2 3 1])
true

>>> [6 1 2 5 4 3].permutationHasPattern([4 2 3 1])
false

>>> [6 1 2 5 4 3].permutationHasPattern([3 4 1 2])
false
```

Of the six permutations of _123_ only one, _321_ avoids the pattern _12_:

```
>>> [1 2 3].permutations.reject { :each |
>>> 	each.permutationHasPattern([1 2])
>>> }
[[3 2 1]]
```

Of the _5!_ (one-hundred and twenty) permutations of _12345_ fourty-two avoid _123_:

```
>>> [1 2 3 4 5].permutations.reject { :each |
>>> 	each.permutationHasPattern([1 2 3])
>>> }.size
42
```

_25314_ is a three-superpattern because it contains all size permutations of length three:

```
>>> [1 2 3].permutations.allSatisfy { :each |
>>> 	[2 5 3 1 4].permutationHasPattern(each)
>>> }
true
```

* * *

See also: permutationPatternPositions

References:
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.has_pattern)
