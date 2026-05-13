# selectIndices

- _selectIndices(c, i)_

Select items in the collection _c_ that have indices in the collection _i_.
The answer is a collection like _c_.

At sequences `selectIndices` is equivalent to `atAll`:

```
>>> [1 3 5 2 4 6]
>>> .selectIndices(2:4)
[3 5 2]

>>> [1 3 5 2 4 6]
>>> .atAll(2:4)
[3 5 2]
```

At dictionaries `selectIndices` answers a dictionary,
where `atAll` answers a `List`:

```
>>> let m = Map[
>>> 	0 -> 1, 1 -> 3, 2 -> 5,
>>> 	3 -> 2, 4 -> 4, 5 -> 6
>>> ];
>>> (m.selectIndices(2:4), m.atAll(2:4))
(
	Map[2 -> 5, 3 -> 2, 4 -> 4],
	[5 2 4]
)
```

* * *

See also: at, atAll, select

Guides: Dictionary Functions, List Functions
