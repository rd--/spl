# sortedElements

- _sortedElements(aBag)_

Answer a `List` of `Association`s between elements and counts, sorted by increasing element.

```
>>> [1 3 5 1 3 1].asBag.sortedElements
[1 -> 3, 3 -> 2, 5 -> 1]

>>> [1 3 5 1 5 1].asBag.sortedElements
[1 -> 3, 3 -> 1, 5 -> 2]

>>> ['a' 'b' 'c' 'a'].asBag.sortedElements
['a' -> 2, 'b' -> 1, 'c' -> 1]
```

* * *

See also: Bag, sortedCounts

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Counts.html)

Categories: Accessing
