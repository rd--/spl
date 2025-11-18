# sortedElements

- _sortedElements(x)_

Answers a `List` of `Association`s between elements and counts,
sorted by increasing element.

At `Multiset`:

```
>>> [1 3 5 1 3 1].Multiset
>>> .sortedElements
[1 -> 3, 3 -> 2, 5 -> 1]

>>> [1 3 5 1 5 1].Multiset
>>> .sortedElements
[1 -> 3, 3 -> 1, 5 -> 2]

>>> 'abcaca'
>>> .characters
>>> .Multiset
>>> .sortedElements
['a' -> 3, 'b' -> 1, 'c' -> 2]
```

At `List`:

```
>>> [1 3 5 1 3 1].sortedElements
[1 -> 3, 3 -> 2, 5 -> 1]
```

* * *

See also: Association, counts, List, Multiset, sortedCounts, valuesAndCounts

Guides: List Functions, Set Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Counts.html)

Categories: Accessing
