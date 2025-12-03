# nestListDistinct

- _nestListDistinct(f:/1, i)_

Make a `List` of the results of applying the block _f_ repeatedly,
starting with the value _i_,
and continuing until the next step is already in the answer list.
Answer the list and also the state that would be next.

Play a round of Bulgarian solitaire:

```
>>> bulgarianSolitaire:/1
>>> .nestListDistinct([2 1 1 1])
[
	[
		2 1 1 1;
		4 1;
		3 2;
		2 2 1;
		3 1 1
	],
	[3 2]
]
```

* * *

See also: fixedPointList, iterate, nestList, nestWhileList

Guides: List Functions

Categories: Enumerating
