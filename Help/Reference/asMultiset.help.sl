# asMultiset

- _asMultiset([x₁ x₂ …])_

Convert the list _x_ to a `Multiset`.

At a `List` of integers:

```
>>> [1 1 1 3 3 5].asMultiset.sortedElements
[1 -> 3, 3 -> 2, 5 -> 1]

>>> [1 1 1 3 3 5].asMultiset.sortedCounts
[3 -> 1, 2 -> 3, 1 -> 5]
```

Count occurrences of characters in a string:

```
>>> 'occurrences'
>>> .characters
>>> .asMultiset
>>> .sortedCounts
[
	3 -> 'c',
	2 -> 'e', 2 -> 'r',
	1 -> 's', 1 -> 'n', 1 -> 'u', 1 -> 'o'
]
```

* * *

See also: Multiset, sortedCounts, sortedElements

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Tally.html),
_Smalltalk_
5.7.1.4

Categories: Converting
