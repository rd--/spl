# gnomeSortMatrix

- _gnomeSortMatrix([x₁ x₂ …])_

Sort the sequence _x_ using the gnome sort algorithm,
record each intermediate state as a row in a matrix.

Matrix holds each intermediate permutation of the initial sequence in turn:

```
>>> [2 1 7 5 3]
>>> .gnomeSortMatrix
[
	2 1 7 5 3;
	1 2 7 5 3;
	1 2 5 7 3;
	1 2 5 3 7;
	1 2 3 5 7
]
```

Plot matrix of sucessive sort states:

~~~spl svg=A
Sfc32(375681)
.randomPermutation(8)
.list
.gnomeSortMatrix
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/gnomeSortMatrix-A.svg)

Plot matrix of sucessive sort states:

~~~spl png=B
Sfc32(375681)
.randomPermutation(36)
.list
.gnomeSortMatrix
.transpose
.rescale
.Greymap
~~~

![](sw/spl/Help/Image/gnomeSortMatrix-B.png)

* * *

See also: gnomeSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Gnome_sort)
