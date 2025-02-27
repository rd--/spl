# asSortedList

- _asSortedList(alpha)_ ⟹ _asSortedList(alpha, <)_
- _asSortedList(aCollection, aBlock:/2)_

Answer a `SortedList` having as items those of _aCollection_,
sorted according to _aBlock_.

At `List`:

```
>>> [1 9 3 7 5].asSortedList.contents
[1 3 5 7 9]
```

Specifiy the sort block, here to maintain a list in reverse order:

```
>>> [1 9 3 7 5].asSortedList(>).contents
[9 7 5 3 1]
```

At `IdentitySet`:

```
>>> let s = IdentitySet();
>>> s.includeAll([1 9 3 7 5]);
>>> s.asSortedList.contents
[1 3 5 7 9]
```

At `Range`:

```
>>> (10, 9 .. 1).asSortedList.contents
[1 2 3 4 5 6 7 8 9 10]
```

* * *

See also: SortedList

References:
_Smalltalk_
5.7.1.9

Categories: Converting
