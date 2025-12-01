# shellSortMatrix

- _shellSortMatrix([x₁ x₂ …])_

Sort the sequence _x_ using the shell sort algorithm,
record each intermediate state as a row in a matrix.

Matrix holds each intermediate permutation of the initial sequence in turn:

```
>>> [62 83 18 53 7 17 95 86 47 69 25 28]
>>> .shellSortMatrix
[
	62 83 18 53  7 17 95 86 47 69 25 28;
	17 83 18 53  7 62 95 86 47 69 25 28;
	17 83 18 47  7 62 95 86 53 69 25 28;
	17 83 18 47  7 25 95 86 53 69 62 28;
	17 83 18 47  7 25 28 86 53 69 62 95;
	17 28 18 47  7 25 83 86 53 69 62 95;
	17  7 18 47 28 25 83 86 53 69 62 95;
	17  7 18 47 28 25 69 86 53 83 62 95;
	17  7 18 47 28 25 69 62 53 83 86 95;
	 7 17 18 47 28 25 69 62 53 83 86 95;
	 7 17 18 28 47 25 69 62 53 83 86 95;
	 7 17 18 28 25 47 69 62 53 83 86 95;
	 7 17 18 25 28 47 69 62 53 83 86 95;
	 7 17 18 25 28 47 62 69 53 83 86 95;
	 7 17 18 25 28 47 62 53 69 83 86 95;
	 7 17 18 25 28 47 53 62 69 83 86 95
]
```

Plot matrix of sucessive sort states:

~~~spl svg=A
Sfc32(372816)
.randomPermutation(11)
.list
.shellSortMatrix
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/shellSortMatrix-A.svg)

* * *

See also: shellSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Shell_sort)
