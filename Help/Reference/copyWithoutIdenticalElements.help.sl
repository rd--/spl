# copyWithoutIdenticalElements

- _copyWithoutIdenticalElements(aCollection)_

Answer a copy of _aCollection_ that removes any duplicates, according to `==`.
If _aCollection_ is a sequence the copy will preserve the order of elements.

```
>>> [1 2 2 3 3 3]
>>> .copyWithoutIdenticalElements
[1 2 3]

>>> [1 1; 1 1; 1 1]
>>> .copyWithoutIdenticalElements
[1 1; 1 1; 1 1]

>>> [1 1; 1 1; 1 1].nub
[[1 1]]
```

* * *

See also: ==, asIdentitySet, copy, copyWith, copyWithout, IdentitySet, nub, Set

Categories: Copying
