# sortedCounts

- _sortedCounts(aBag | aCollection)_

Answer a `List` of `Association`s between counts and elements, sorted by _decreasing_ count.

The `Collection` form converts the collection to an `IdentityBag` using `asIdentityBag`.

```
>>> [1 2 3 1 2 1].sortedCounts
[3 -> 1, 2 -> 2, 1 -> 3]

>>> [1 2 3 1 3 1].sortedCounts
[3 -> 1, 2 -> 3, 1 -> 2]
```

* * *

See also: asIdentityBag, Association, IdentityBag, List, sortedElements

Categories: Accessing
