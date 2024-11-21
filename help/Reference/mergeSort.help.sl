# mergeSort

- _mergeSort(aSequence)_

Sort _aSequence_ in place using the mergesort algorithm.
Mergesort is a worst-case _O(N log N)_ sorting algorithm that usually does only half as many comparisons as heapsort or quicksort.

Sort two items in place:

```
>>> let l = [2 1];
>>> (l.mergeSort == l, l)
(true, [1 2])
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
>>> Sfc32(24015).randomInteger(1, 23, [17]).mergeSort
[1 3 3 6 7 8 9 10 10 12 13 15 17 18 21 22 23]
```

* * *

See also: isSorted, mergeSortBy, mergeSortByFromTo, sort

Categories: Sorting
