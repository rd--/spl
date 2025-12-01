# cycleSortMatrix

- _cycleSortMatrix([x₁ x₂ …])_

Sort the sequence _x_ using the cycle sort algorithm,
record each intermediate state as a row in a matrix.
The intermediate states contain `nil` values at certain points.

Matrix holds each intermediate permutation of the initial sequence in turn:

```
>>> [5 2 4 3 1]
>>> .cycleSortMatrix
>>> .replaceNil(0)
[
	5 2 4 3 1;
	0 2 4 3 1;
	0 2 4 3 5;
	1 2 4 3 5;
	1 2 0 3 5;
	1 2 0 4 5;
	1 2 3 4 5
]
```

Plot matrix of sucessive sort states:

~~~spl svg=A
Sfc32(417821)
.randomPermutation(12)
.list
.cycleSortMatrix
.replaceNil(0)
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/cycleSortMatrix-A.svg)

Sort longer list:

~~~spl png=B
Sfc32(417821)
.randomPermutation(128)
.list
.cycleSortMatrix
.replaceNil(0)
.transpose
.rescale
.Greymap
~~~

![](sw/spl/Help/Image/cycleSortMatrix-B.png)

* * *

See also: cycleSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Cycle_sort)
