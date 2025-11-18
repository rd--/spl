# asSortedList

- _asSortedList(c, f:/2)_

Answer a `SortedList` having as items those of the collection _c_,
sorted according to _f_.

At `List`:

```
>>> let x = [1 9 3 7 5];
>>> let y = x.asSortedList;
>>> (y.contents, x !== y.contents)
([1 3 5 7 9], true)
```

Specifiy the sort block, here to maintain a list in reverse order:

```
>>> [1 9 3 7 5]
>>> .asSortedList(>)
>>> .contents
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
>>> [10, 9 .. 1].asSortedList.contents
[1 2 3 4 5 6 7 8 9 10]
```

* * *

See also: SortedList

Guides: List Functions

References:
_Smalltalk_
5.7.1.9

Categories: Converting
