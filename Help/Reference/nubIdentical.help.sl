# nubIdentical

- _nubIdentical(aCollection)_

Answer a copy of _aCollection_ that removes any duplicates, according to `==`.
If _aCollection_ is a `Sequence` the copy will preserve the order of elements.

```
>>> Sfc32(38014)
>>> .randomInteger([1 9], [99])
>>> .nubIdentical
[9 4 8 3 2 1 6 7 5]
```

At `Record`:

```
>>> (x: 1, y: 1, z: 1).nubIdentical
(x: 1)
```

* * *

See also: =, ==, asIdentitySet, copyWithoutIdenticalElements, deleteDuplicates, nub, nubBy, nubCumulatively, nubSieve, Set

Categories: Copying
