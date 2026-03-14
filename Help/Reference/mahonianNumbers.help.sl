# mahonianNumbers

- _mahonianNumbers(n)_

Answer the first _n_ rows of the triangle of Mahonian numbers.
The number of elements in row _n_ is given by the _n_-th triangular number.

Table of Mahonian numbers,
OEIS [A008302](https://oeis.org/A008302):

```
>>> 5.mahonianNumbers
[
	1;
	1 1;
	1 2 2 1;
	1 3 5 6 5 3 1;
	1 4 9 15 20 22 20 15 9 4 1
]
```

Table of Mahonian numbers,
read by rows,
OEIS [A008302](https://oeis.org/A008302):

~~~spl svg=A oeis=A008302
6.mahonianNumbers
.catenate.discretePlot
~~~

![](sw/spl/Help/Image/mahonianNumbers-A.svg)

* * *

See also: majorIndex, triangularNumber

Guides: Integer Sequence Functions, Permutation Functions
