# mergeSortFromToBy

- _mergeSortFromToBy([x₁ x₂ …], i, j, f:/2)_

Sort the sequence _x_ in place using the merge sort algorithm,
between the indicated start and end indices _i_ and _j_,
using the specified comparator _f_.

Sort the middle of a sequence:

```
>>> [3 2 1 3 2 1 3 2 1]
>>> .mergeSortFromToBy(4, 6, <)
[3 2 1 1 2 3 3 2 1]
```

Sort a first half of a random sequence of integers:

```
>>> let r = Sfc32(178942);
>>> let l = r.randomInteger([1 23], [20]);
>>> [
>>> 	l,
>>> 	l.copy.mergeSortFromToBy(
>>> 		1, 10, <
>>> 	)
>>> ]
[
	11 17 16 5 7 10 14 13 22 1
	6 2 17 2 20 4 3 3 17 6
	;
	1 5 7 10 11 13 14 16 17 22
	6 2 17 2 20 4 3 3 17 6
]
```

* * *

See also: isSorted, mergeSort, mergeSortBy, sort

Guides: Sort Functions

Categories: Sorting
