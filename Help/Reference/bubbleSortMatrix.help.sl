# bubbleSortMatrix

- _bubbleSortMatrix([x₁ x₂ …])_

Sort the sequence _x_ using the bubble sort algorithm,
record each intermediate state as a row in a matrix.

Matrix holds each intermediate permutation of the initial sequence in turn:

```
>>> [5 1 4 2 8]
>>> .bubbleSortMatrix
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
Sfc32(327681)
.randomPermutation(8)
.list
.bubbleSortMatrix
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/bubbleSortMatrix-A.svg)

Plot matrix of sucessive sort states:

~~~spl png=B
Sfc32(372681)
.randomPermutation(36)
.list
.bubbleSortMatrix
.transpose
.rescale
.Greymap
~~~

![](sw/spl/Help/Image/bubbleSortMatrix-B.png)

* * *

See also: bubbleSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Bubble_sort)
