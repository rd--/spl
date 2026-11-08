# indexForInserting

- _indexForInserting(c, x)_

At the `SortedList` _c_,
answers the index where the object _x_ would be inserted.

```
>>> let a = SortedList[0 2.5 5 7.5 10];
>>> -1:11.collect { :i |
>>> 	a.indexForInserting(i)
>>> }
[1 2 2 2 3 3 4 4 4 5 5 6 6]

>>> let a = SortedList[1];
>>> let b = a.indexForInserting(3);
>>> a.add!(3);
>>> (a, b)
(SortedList([1 3]), 2)
```

* * *

See also: SortedList, binarySearchLeftmost

Guides: Indexing Functions
