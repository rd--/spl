# sortedCounts

- _sortedCounts(b)_

At `Multiset`,
answer a `List` of `Association`s between counts and elements, sorted by _decreasing_ count.

```
>>> [1 2 3 1 2 1].asMultiset.sortedCounts
[3 -> 1, 2 -> 2, 1 -> 3]

>>> [1 2 3 1 3 1].asMultiset.sortedCounts
[3 -> 1, 2 -> 3, 1 -> 2]

>>> 'abcaca'.characters.asMultiset.sortedCounts
[3 -> 'a', 2 -> 'c', 1 -> 'b']
```

* * *

See also: asIdentityMultiset, Association, IdentityMultiset, List, sortedElements

Categories: Accessing
