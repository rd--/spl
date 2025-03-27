# asIdentityBag

- _asIdentityBag(aList)_

Convert _aList_ to a `IdentityBag`.

```
>>> [1 1 1 3 3 5].asIdentityBag.sortedElements
[1 -> 3, 3 -> 2, 5 -> 1]

>>> [1 1 1 3 3 5].asIdentityBag.sortedCounts
[3 -> 1, 2 -> 3, 1 -> 5]
```

Count occurrences of characters in a string:

```
>>> 'occurrences'
>>> .contents
>>> .asIdentityBag
>>> .sortedCounts
[
	3 -> 'c',
	2 -> 'e', 2 -> 'r',
	1 -> 's', 1 -> 'n', 1 -> 'u', 1 -> 'o'
]
```

* * *

See also: IdentityBag, sortedCounts, sortedElements

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Tally.html),
_Smalltalk_
5.7.1.4

Categories: Converting
