# selectionSortMatrix

- _selectionSortMatrix([x₁ x₂ …])_

Sort the sequence _x_ using the selection sort algorithm,
record each intermediate state as a row in a matrix.

Matrix holds each intermediate permutation of the initial sequence in turn:

```
>>> [12 25 64 11 22]
>>> .selectionSortMatrix
[
	12 25 64 11 22;
	12 25 22 11 64;
	12 11 22 25 64;
	11 12 22 25 64
]
```

Plot matrix of sucessive sort states:

~~~spl svg=A
Sfc32(326871)
.randomPermutation(13)
.list
.selectionSortMatrix
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/selectionSortMatrix-A.svg)

Sort longer list:

~~~spl png=B
Sfc32(326871)
.randomPermutation(128)
.list
.selectionSortMatrix
.transpose
.rescale
.Greymap
~~~

![](sw/spl/Help/Image/selectionSortMatrix-B.png)

* * *

See also: selectionSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Selection_sort)
