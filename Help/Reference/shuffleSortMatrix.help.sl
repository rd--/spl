# shuffleSortMatrix

- _shuffleSortMatrix([x₁ x₂ …])_

Sort the sequence _x_ using the shuffle sort algorithm,
record each intermediate state as a row in a matrix.

Matrix holds each intermediate permutation of the initial sequence in turn:

```
>>> [5 1 4 2 8]
>>> .shuffleSortMatrix
[
	5 1 4 2 8;
	1 5 4 2 8;
	1 4 5 2 8;
	1 4 2 5 8;
	1 2 4 5 8
]
```

Plot matrix of sucessive sort states:

~~~spl svg=A
Sfc32(375694)
.randomPermutation(8)
.list
.shuffleSortMatrix
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/shuffleSortMatrix-A.svg)

Sort longer list:

~~~spl png=B
Sfc32(375694)
.randomPermutation(36)
.list
.shuffleSortMatrix
.transpose
.rescale
.Greymap
~~~

![](sw/spl/Help/Image/shuffleSortMatrix-B.png)

* * *

See also: shuffleSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Shuffle_sort)
