# sortedCounts

- _sortedCounts(x)_

Answer a `List` of `Association`s between counts and elements,
sorted by _decreasing_ count.

At `Multiset`:

```
>>> [1 2 3 1 2 1].Multiset
>>> .sortedCounts
[3 -> 1, 2 -> 2, 1 -> 3]

>>> [1 2 3 1 3 1].Multiset
>>> .sortedCounts
[3 -> 1, 2 -> 3, 1 -> 2]

>>> 'abcaca'
>>> .characters
>>> .Multiset
>>> .sortedCounts
[3 -> 'a', 2 -> 'c', 1 -> 'b']
```

At `List`:

```
>>> [1 2 3 1 2 1]
>>> .sortedCounts
[3 -> 1, 2 -> 2, 1 -> 3]
```

* * *

See also: Association, Multiset, List, sortedElements

Guides: List Functions, Set Functions

Categories: Accessing
