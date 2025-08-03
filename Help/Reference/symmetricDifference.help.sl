# symmetricDifference

- _symmetricDifference(c₁, c₂)_

Answer the symmetric difference of the two collections,
the elements that are in one or the other collection but not in both.

```
>>> [1 2 3].symmetricDifference([3 4])
[1 2 4]

>>> [1 2 'c' 'b' 'a']
>>> .symmetricDifference([4 3 2 1])
['c' 'b' 'a' 4 3]

>>> [1 2 3].symmetricDifference([2 3 4])
[1 4]
```

The symmetric difference with an empty collection is the non-empty collection:

```
>>> [1 2 3].symmetricDifference([])
[1 2 3]

>>> [].symmetricDifference([1 2 3])
[1 2 3]
```

* * *

See also: difference, intersection, union

Guides: Set Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SymmetricDifference.html)

Categories: Set, Logic
