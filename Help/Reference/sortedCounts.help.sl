# sortedCounts

- _sortedCounts(aBag)_

Answer a `List` of `Association`s between counts and elements, sorted by _decreasing_ count.

```
>>> [1 2 3 1 2 1].asIdentityBag.sortedCounts
[3 -> 1, 2 -> 2, 1 -> 3]

>>> [1 2 3 1 3 1].asIdentityBag.sortedCounts
[3 -> 1, 2 -> 3, 1 -> 2]
```

* * *

See also: asIdentityBag, Association, IdentityBag, List, sortedElements

Categories: Accessing
