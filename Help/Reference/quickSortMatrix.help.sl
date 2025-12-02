# quickSortMatrix

- _quickSortMatrix([x₁ x₂ …])_

Sort the sequence _x_ using the Hoare’s quick sort algorithm,
record each intermediate state as a row in a matrix.

Matrix holds each intermediate permutation of the initial sequence in turn:

```
>>> [3 4 2 1 7 5 8 9 0 6]
>>> .quickSortMatrix
[
	3 4 2 1 7 5 8 9 0 6;
	0 4 2 1 7 5 8 9 3 6;
	0 1 2 4 7 5 8 9 3 6;
	0 1 2 3 7 5 8 9 4 6;
	0 1 2 3 6 5 8 9 4 7;
	0 1 2 3 6 5 4 9 8 7;
	0 1 2 3 4 5 6 9 8 7;
	0 1 2 3 4 5 6 7 8 9
]
```

Plot matrix of sucessive sort states:

~~~spl svg=A
Sfc32(396871)
.randomPermutation(13)
.list
.quickSortMatrix
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/quickSortMatrix-A.svg)

Sort longer list:

~~~spl png=B
Sfc32(369781)
.randomPermutation(128)
.list
.quickSortMatrix
.transpose
.rescale
.Greymap
~~~

![](sw/spl/Help/Image/quickSortMatrix-B.png)

* * *

See also: mergeSortMatrix, quickSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Quick_sort)

Further Reading: Hoare 1961

Categories: Sorting
