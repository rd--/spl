# permutationOrderList

- _permutationOrderList(aPermutation)_

Answer the `List` of permutations of successive self products until arriving at identity.

```
>>> [1 6 2; 3 5; 4].cycles.orderList
[
	[1 6 2; 3 5; 4].cycles,
	[1 2 6; 3; 4; 5].cycles,
	[1; 2; 3 5; 4; 6].cycles,
	[1 6 2; 3; 4; 5].cycles,
	[1 2 6; 3 5; 4].cycles
]
```

* * *

See also: permutationOrder

Categories: Permutations
