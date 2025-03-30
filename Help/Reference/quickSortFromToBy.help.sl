# quickSortFromToBy

- _quickSortFromToBy(aSequence, startIndex, endIndex, sortBlock:/2)_

Sort elements _startIndex_ through _endIndex_ of _aSequence_ to be non-descending according to _sortBlock_
using an in-place quicksort with simple median-of-three	partitioning with guaranteed _O(log(n))_ space usage.

Sort the middle of a sequence:

```
>>> [3 2 1 3 2 1 3 2 1]
>>> .quickSortFromToBy(4, 6, <)
[3, 2, 1, 1, 2, 3, 3, 2, 1]
```

Sort a first half of a random sequence of integers:

```
>>> let r = Sfc32(178942);
>>> let l = r.randomInteger([1 23], [10]);
>>> [
>>> 	l,
>>> 	l.copy.quickSortFromToBy(
>>> 		1, 5, <
>>> 	)
>>> ]
[
	11 17 16 5 7 10 14 13 22 1;
	5 7 11 16 17 10 14 13 22 1
]
```

* * *

See also: quickSort, quickSortBy

Guides: Sort Functions
