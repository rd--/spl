# radixSortMatrix

- _radixSortMatrix([x₁ x₂ …])_

Sort the sequence _x_ using the radix sort algorithm,
record each intermediate state as a row in a matrix.

Matrix holds each intermediate permutation of the initial sequence in turn:

```
>>> [5 1 4 2 8]
>>> .radixSortMatrix
>>> .deleteDuplicates
[
	5 1 4 2 8;
	1 4 2 8 5;
	4 2 8 5 1;
	4 8 5 1 2;
	8 5 1 2 4;
	8 1 2 4 5;
	1 2 4 5 8
]
```

Plot matrix of sucessive sort states:

~~~spl svg=A
Sfc32(327481)
.randomPermutation(9)
.list
.radixSortMatrix
.deleteDuplicates
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/radixSortMatrix-A.svg)

* * *

See also: radixSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Radix_sort)
