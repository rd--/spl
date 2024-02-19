# mergeSort

_mergeSort(aSequence)_

Sort _aSequence_ using the mergesort algorithm.
Mergesort is a worst-case _O(N log N)_ sorting algorithm that usually does only half as many comparisons as heapsort or quicksort.

Sort two items in place:

```
>>> let l = [2 1];
>>> l.mergeSort = l & { l = [1 2] }
true
```

Sort three items:

```
>>> [3 2 1].mergeSort
[1 2 3]
```

Sort more than three items:

```
>>> [5 4 3 2 1].mergeSort
[1 2 3 4 5]
```

Sort a sorted sequence:

```
>>> [1 .. 99].mergeSort
[1 .. 99]
```

Sort a descending sequence:

```
>>> [99 .. 1].mergeSort
[1 .. 99]
```

Sort a random sequence of integers:

```
>>> 1.randomInteger(9, 99).mergeSort.isSorted
true
```

* * *

See also: isSorted, mergeSortBy, mergeSortByFromTo, sort
