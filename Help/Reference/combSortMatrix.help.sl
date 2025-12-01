# combSortMatrix

- _combSortMatrix([x₁ x₂ …])_

Sort the sequence _x_ using the comb sort algorithm,
record each intermediate state as a row in a matrix.

Matrix holds each intermediate permutation of the initial sequence in turn:

```
>>> [3 7 4 9 5 2 6 1]
>>> .combSortMatrix
[
	3 7 4 9 5 2 6 1;
	3 1 4 9 5 2 6 7;
	3 1 4 7 5 2 6 9;
	3 1 2 7 5 4 6 9;
	3 1 2 6 5 4 7 9;
	2 1 3 6 5 4 7 9;
	2 1 3 4 5 6 7 9;
	1 2 3 4 5 6 7 9
]
```

Plot matrix of sucessive sort states:

~~~spl svg=A
Sfc32(372861)
.randomPermutation(13)
.list
.combSortMatrix
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/combSortMatrix-A.svg)

* * *

See also: combSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Comb_sort)
