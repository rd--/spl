# insertionSortMatrix

- _insertionSortMatrix([x₁ x₂ …])_

Sort the sequence _x_ using the insertion sort algorithm,
record each intermediate state as a row in a matrix.

Matrix holds each intermediate permutation of the initial sequence in turn:

```
>>> [3 7 4 9 5 2 6 1]
>>> .insertionSortMatrix
[
	3 7 4 9 5 2 6 1;
	3 4 7 9 5 2 6 1;
	3 4 5 7 9 2 6 1;
	2 3 4 5 7 9 6 1;
	2 3 4 5 6 7 9 1;
	1 2 3 4 5 6 7 9
]
```

Plot matrix of sucessive sort states:

~~~spl svg=A
Sfc32(372861)
.randomPermutation(13)
.list
.insertionSortMatrix
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/insertionSortMatrix-A.svg)

* * *

See also: insertionSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Insertion_sort)
