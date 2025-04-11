# indexForInserting

- _indexForInserting(aSortedList, anObject)_

At `SortedList`,
answers the index where _anObject_ would be inserted.

```
>>> let l = [0 2.5 5 7.5 10].asSortedList;
>>> (-1 .. 11).collect { :each |
>>> 	l.indexForInserting(each)
>>> }
[1 2 2 2 3 3 4 4 4 5 5 6 6]
```

* * *

See also: binarySearchLeftmost, SortedList
