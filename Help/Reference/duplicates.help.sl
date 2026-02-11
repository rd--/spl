# selectDuplicates

- _selectDuplicates(c)_

Select items in the collection _c_ that appear more than once.

At `List`:

```
>>> [1 2 1 2 3 4 5 1].selectDuplicates
[1 2 1 2 1]
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3, a: 1, c: 3)
>>> .selectDuplicates
(x: 1, z: 3, a: 1, c: 3)
```

The set of duplicate items is given by `duplicatesSet`:

```
>>> [1 2 1 2 3 4 5 1]
>>> .duplicatesSet
Set([1 2])

>>> (x: 1, y: 2, z: 3, a: 1, c: 3)
>>> .duplicatesSet
Set([1 3])
```

* * *

See also: duplicatesSet, isDuplicateFree, select

Guides: List Functions
