# SortedList

- _SortedList([x₁ x₂ …], f:/2)_

A `Type` holding a `List` where insertions (using `add` and `addAll`) maintain the list ordering,
which is specified by a sort block that is ordinarily `precedesOrEqualTo`.

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
>>> SortedList(
>>> 	[1 2 2 3 3 3 4 4 4 4]
>>> ).occurrencesOf(3)
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

Implements `++`:

```
>>> SortedList([1 3 5]) ++ SortedList([2 4 6])
SortedList([1, 2, 3, 4, 5, 6])
```

`Complex` does not implement `<=` but does implement `precedesOrEqualTo`:

```
>>> SortedList(
>>> 	[2J2 1J1 0J0 -1J-1]
>>> ).asList
[0J0 -1J-1 1J1 2J2]
```

* * *

See also: add, addAll, asSortedList, List, sort, sorted

Guides: List Functions

References:
_Smalltalk_
5.7.17.10

Categories: Collection, Type
