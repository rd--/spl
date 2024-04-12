# permutationOrderList

- _permutationOrderList(aPermutation)_

Answer the `List` of permutations of successive self products until arriving at identity.

```
>>> [1 6 2; 3 5].cycles.permutationOrderList
[
	[[1 6 2] [3 5]].cycles,
	[[1 2 6]].cycles,
	[[3 5]].cycles,
	[[1 6 2]].cycles,
	[[1 2 6] [3 5]].cycles
]
```

* * *

See also: permutationOrder

Categories: Permutations
