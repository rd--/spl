# mergeSortMatrix

- _mergeSortMatrix([x₁ x₂ …])_

Sort the sequence _x_ using the merge sort algorithm,
record each intermediate state as a row in a matrix.

Matrix holds each intermediate permutation of the initial sequence in turn:

```
>>> [3 4 2 1 7 5 8 9 0 6]
>>> .mergeSortMatrix
[
	3 4 2 1 7 5 8 9 0 6;
	2 3 4 1 7 5 8 9 0 6;
	1 2 3 4 7 5 8 9 0 6;
	1 2 3 4 7 0 5 8 9 6;
	1 2 3 4 7 0 5 6 8 9;
	0 1 2 3 4 7 5 6 8 9;
	0 1 2 3 4 5 7 6 8 9;
	0 1 2 3 4 5 6 7 8 9
]
```

Plot matrix of sucessive sort states:

~~~spl svg=A
Sfc32(397681)
.randomPermutation(10)
.list
.mergeSortMatrix
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/mergeSortMatrix-A.svg)

Sort longer list:

~~~spl png=B
Sfc32(397681)
.randomPermutation(128)
.list
.mergeSortMatrix
.transpose
.rescale
.Greymap
~~~

![](sw/spl/Help/Image/mergeSortMatrix-B.png)

* * *

See also: mergeSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Merge_sort)
