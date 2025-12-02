# bitonicSortMatrix

- _bitonicSortMatrix([x₁ x₂ …])_

Sort the sequence _x_ using the bitonic sort algorithm,
record each intermediate state as a row in a matrix.

Matrix holds each intermediate permutation of the initial sequence in turn:

```
>>> [5 1 4 2 3 7 6 8]
>>> .bitonicSortMatrix
[
	5 1 4 2 3 7 6 8;
	1 5 4 2 3 7 6 8;
	1 2 4 5 3 7 6 8;
	1 2 4 5 3 7 8 6;
	1 2 4 5 8 7 3 6;
	1 2 4 5 8 7 6 3;
	1 2 4 3 8 7 6 5;
	1 2 3 4 8 7 6 5;
	1 2 3 4 6 7 8 5;
	1 2 3 4 6 5 8 7;
	1 2 3 4 5 6 8 7;
	1 2 3 4 5 6 7 8
]
```

Plot matrix of sucessive sort states:

~~~spl svg=A
Sfc32(362718)
.randomPermutation(8)
.list
.bitonicSortMatrix
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/bitonicSortMatrix-A.svg)

Sort longer list:

~~~spl png=B
Sfc32(362718)
.randomPermutation(64)
.list
.bitonicSortMatrix
.transpose
.rescale
.Greymap
~~~

![](sw/spl/Help/Image/bitonicSortMatrix-B.png)

* * *

See also: bitonicSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Bitonic_sorter)
