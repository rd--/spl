# sortedWithIndices

- _sortedWithIndices(aSequence, aBlock:/2)_
- _sortedWithIndices(α)_ ⟹ _sortedWithIndices(α, <=)_

Sort items in _aSequence_ according to _aBlock_ and answer each associated with its initial index.

Sort `contents` of a `String`:

```
>>> 'string'.contents.sortedWithIndices
[
	'g' -> 6,
	'i' -> 4,
	'n' -> 5,
	'r' -> 3,
	's' -> 1,
	't' -> 2
]
```

Sort a `List`:

```
>>> [1 3 2 5 4].sortedWithIndices
[
	1 -> 1,
	2 -> 3,
	3 -> 2,
	4 -> 5,
	5 -> 4
]
```

* * *

See also: sorted

Guides: Sort Functions

Categories: Sorting
