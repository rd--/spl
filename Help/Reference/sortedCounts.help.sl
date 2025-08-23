# sortedCounts

- _sortedCounts(b)_

At `Bag`,
answer a `List` of `Association`s between counts and elements, sorted by _decreasing_ count.

```
>>> [1 2 3 1 2 1].asBag.sortedCounts
[3 -> 1, 2 -> 2, 1 -> 3]

>>> [1 2 3 1 3 1].asBag.sortedCounts
[3 -> 1, 2 -> 3, 1 -> 2]

>>> 'abcaca'.characters.asBag.sortedCounts
[3 -> 'a', 2 -> 'c', 1 -> 'b']
```

* * *

See also: asIdentityBag, Association, IdentityBag, List, sortedElements

Categories: Accessing
