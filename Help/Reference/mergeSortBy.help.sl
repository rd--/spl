# mergeSortBy

- _mergeSortBy(aSequence, aBlock:/2)_

Sort _aSequence_ in place using the comparator _aBlock_ using the merge sort algorithm.
Answers _aSequence_.

At `List`, sort into descending order:

```
>>> let a = [1 7 3 9 5];
>>> a.mergeSortBy(>=);
>>> a
[9, 7 .. 1]
```

At `List`, sort into ascending order:

```
>>> [1 7 3 9 5].mergeSortBy(<=)
[1, 3 .. 9]
```

* * *

See also: mergeSort, sort, sortBy, sortByOn, sorted, sortOn

Guides: Sort Functions

Categories: Sorting
