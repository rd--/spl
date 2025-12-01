# oddEvenSortMatrix

- _oddEvenSortMatrix([x₁ x₂ …])_

Sort the sequence _x_ using the odd-even sort algorithm,
record each intermediate state as a row in a matrix.

Matrix holds each intermediate permutation of the initial sequence in turn:

```
>>> [5 1 4 2 8]
>>> .oddEvenSortMatrix
[
	5 1 4 2 8;
	1 5 4 2 8;
	1 5 2 4 8;
	1 2 5 4 8;
	1 2 4 5 8
]
```

Plot matrix of sucessive sort states:

~~~spl svg=A
Sfc32(376581)
.randomPermutation(9)
.list
.oddEvenSortMatrix
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/oddEvenSortMatrix-A.svg)

Sort longer list:

~~~spl png=B
Sfc32(376581)
.randomPermutation(36)
.list
.oddEvenSortMatrix
.transpose
.rescale
.Greymap
~~~

![](sw/spl/Help/Image/oddEvenSortMatrix-B.png)

* * *

See also: oddEvenSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Odd-even_sort)
