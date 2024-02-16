# deleteDuplicates

_deleteDuplicates(alpha, beta)_ => _nubBy(alpha, beta)_
_deleteDuplicates(alpha)_ => _nub(alpha, beta)_

An alias for _nub_.

```
>>> [1 3 5 3 5 9 5 2 3 5 7 3 5 7 3].deleteDuplicates
[1 3 5 9 2 7]
```

_Note:_
This does not actually delete elements from the collection,
it answers a copy of the collection without the duplicate elements.

* * *

See also: nub, nubBy
