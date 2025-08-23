# sortedElements

- _sortedElements(b)_

At `Bag`,
answer a `List` of `Association`s between elements and counts of the bag _b_,
sorted by increasing element.
The idiom `asBag` of `sortedElements` can be written as `counts`.

```
>>> [1 3 5 1 3 1].asBag.sortedElements
[1 -> 3, 3 -> 2, 5 -> 1]

>>> [1 3 5 1 5 1].asBag.sortedElements
[1 -> 3, 3 -> 1, 5 -> 2]

>>> 'abcaca'.characters.asBag.sortedElements
['a' -> 3, 'b' -> 1, 'c' -> 2]
```

* * *

See also: asIdentityBag, counts, IdentityBag, sortedCounts

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Counts.html)

Categories: Accessing
