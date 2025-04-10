# SortedList

- _SortedList(l)_

A `Type` holding a `List` where insertions (using `add` and `addAll`) maintain the list ordering,
which is specified by a sort block.

```
>>> let l = SortedList([]);
>>> l.add(3);
>>> l.add(2);
>>> l.add(1);
>>> l
SortedList([1 2 3])
```

`addAll` adds each item in turn, `contents` answers the sorted `List` value:

```
>>> let l = SortedList([5 1 6 4]);
>>> l.add(2);
>>> l.addAll([3 7]);
>>> l.contents
[1 2 3 4 5 6 7]
```

Remove item:

```
>>> let l = SortedList([1 2 3 4 5]);
>>> let o = l.remove(5);
>>> (o, l)
(5, SortedList([1 2 3 4]))
```

Count occurrences of an item:

```
>>> let l = SortedList([1 2 2 3 3 3 4 4 4 4]);
>>> l.occurrencesOf(3)
3
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
