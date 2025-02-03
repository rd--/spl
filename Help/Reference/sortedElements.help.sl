# sortedElements

- _sortedElements(aBag | aCollection)_

Answer a `List` of `Association`s between elements and counts, sorted by increasing element.

The `Collection` form converts the collection to an `IdentityBag` using `asIdentityBag`.

```
>>> [1 3 5 1 3 1].sortedElements
[1 -> 3, 3 -> 2, 5 -> 1]

>>> [1 3 5 1 5 1].sortedElements
[1 -> 3, 3 -> 1, 5 -> 2]

>>> ['a' 'b' 'c' 'a'].sortedElements
['a' -> 2, 'b' -> 1, 'c' -> 1]
```

* * *

See also: asIdentityBag, IdentityBag, sortedCounts

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Counts.html)

Categories: Accessing
