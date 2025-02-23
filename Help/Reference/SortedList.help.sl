# SortedList

A `Type` holding a `List` where insertions (using `add` and `addAll`) maintain the list ordering,
which is specified by a sort block.

`asSortedList` answers a `SortedList` having the elements of the collection:

```
>>> let l = [5 1 6 4].asSortedList;
>>> l.add(2);
>>> l.addAll([3 7]);
>>> l.contents
[1 2 3 4 5 6 7]
```

Add `String` items to a `SortedList` and ask for the `middle` and `median` elements:

```
>>> let l = SortedList();
>>> l.add('truite');
>>> l.add('carpe');
>>> l.add('porcinet');
>>> (l.middle, l.median)
('porcinet', 'porcinet')
```

* * *

See also: add, addAll, asSortedList, List, sort, sorted

References:
_Smalltalk_
5.7.17.10

Categories: Collection, Type
