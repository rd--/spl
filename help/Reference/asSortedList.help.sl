# asSortedList

_asSortedList(aCollection)_

Answer a SortedList having as items those of _aCollection_.

At List:

```
>>> [1 9 3 7 5].asSortedList.contents
[1 3 5 7 9]
```

At Set:

```
>>> let s = Set();
>>> s.includeAll([1 9 3 7 5]);
>>> s.asSortedList.contents
[1 3 5 7 9]
```

* * *

See also: SortedList
