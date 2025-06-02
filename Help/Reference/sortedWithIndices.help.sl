# sortedWithIndices

- _sortedWithIndices(l, f:/2=<)_

Sort items in the sequence _l_ according to _f_ and answer each associated with its initial index.

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

A list with equal elements:

```
>>> [0 2 3 2].sortedWithIndices(<)
[0 -> 1, 2 -> 2, 2 -> 4, 3 -> 3]
```

* * *

See also: sorted

Guides: Sort Functions

Categories: Sorting
