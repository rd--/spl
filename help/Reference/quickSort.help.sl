# quickSort

_quickSort(aSequence)_

Sort elements of _aSequence_ to be non-descending according to _<=_ using an in-place quicksort with simple median-of-three partitioning with guaranteed _O(log(n))_ space usage.

Sort two items in place:

```
>>> let l = [2 1];
>>> l.quickSort = l & { l = [1 2] }
true
```

Sort three items:

```
>>> [3 2 1].quickSort
[1 2 3]
```

Sort more than three items:

```
>>> [5 4 3 2 1].quickSort
[1 2 3 4 5]
```

Sort a sorted sequence:

```
>>> [1 .. 99].quickSort
[1 .. 99]
```

Sort a descending sequence:

```
>>> [99 .. 1].quickSort
[1 .. 99]
```

Sort a random sequence of integers:

```
>>> system.randomInteger(1, 9, 99).quickSort.isSorted
true
```

* * *

See also: isSorted, quickSortBy, quickSortByFromTo, sort
