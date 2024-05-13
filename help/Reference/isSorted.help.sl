# isSorted

- _isSorted(aSequence)_

Answers `true` if _aSequence_ is sorted by `<=`, else `false`.

At `List`:

```
>>> [1, 3 .. 11].isSorted
true

>>> [1, 3, 2, 5, 4].isSorted
false

>>> [5 12 33 39 78 90 95 107].isSorted
true
```

At `Tuple`:

```
>>> (1, 3, 5, 7, 9, 11).isSorted
true

>>> (1, 3, 2, 5, 4).isSorted
false
```

At `Range`:

```
>>> 1:9.isSorted
true

>>> 9:1.isSorted
false
```

* * *

See also: isSortedBy, sort, sorted

Categories: Sorting
