# valuesAndCounts

- _valuesAndCounts(m)_

Answer the dictionary of the multiset _m_,
which is not sorted.
The values are the keys and the counts are the values.

At `Multiset` answers a `Dictionary`:

```
>>> let l = [3 2 1 2 3 1 2 1 0];
>>> let m = l.Multiset;
>>> (
>>> 	m.valuesAndCounts,
>>> 	m.elementsAndCounts,
>>> 	m.sortedElements
>>> )
(
	[|3 -> 2, 2 -> 3, 1 -> 3, 0 -> 1|],
	[3 2; 2 3; 1 3; 0 1],
	[0 -> 1, 1 -> 3, 2 -> 3, 3 -> 2]
)
```

At `IdentityMultiset` answers a `Map`:

```
>>> [3 2 1 2 3 1 2 1 0]
>>> .IdentityMultiset
>>> .valuesAndCounts
[3: 2, 2: 3, 1: 3, 0: 1]
```

* * *

See also: sortedElements

Guides: List Functions, Set Functions

Categories: Accessing
