# sortedCounts

- _sortedCounts(x)_

Answer a `List` of `Association`s between counts and elements,
sorted by _decreasing_ count.

At `Multiset`:

```
>>> Multiset([1 2 3 1 2 1], ==)
>>> .sortedCounts
[3 -> 1, 2 -> 2, 1 -> 3]

>>> Multiset([1 2 3 1 3 1], ==)
>>> .sortedCounts
[3 -> 1, 2 -> 3, 1 -> 2]
```

At `List`:

```
>>> [1 2 3 1 2 1]
>>> .sortedCounts(==)
[3 -> 1, 2 -> 2, 1 -> 3]

>>> List'abcaca'
>>> .sortedCounts
[3 -> 'a', 2 -> 'c', 1 -> 'b']
```

* * *

See also: Association, List, Multiset, sortedElements

Guides: List Functions, Set Functions

Categories: Accessing
