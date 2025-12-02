# insertionSort

- _insertionSort([x₁ x₂ …], f:/2, g:/1)_

Sort the sequence _x_ in place using the insertion sort algorithm.
The comparison block can be given as the binary block _f_.
The sort process can be monitored by the unary block _g_.

Sort list:

```
>>> [1 3 5 2 4].insertionSort
[1 2 3 4 5]

>>> [1 3 5 2 4].insertionSort(>)
[5 4 3 2 1]
```

Sort is in place:

```
>>> let s = [1 3 5 2 4];
>>> let t = s.insertionSort;
>>> (t, t == s)
([1 2 3 4 5], true)
```

Show comparisons made in doing a sort:

~~~spl svg=A
let n = 150;
let m = 50;
let r = [];
0:n.collect { :x |
	(x.sin * m).round
}.insertionSort { :a :b |
	r.add(a);
	a > b
};
r.downsample(4).scatterPlot
~~~

![](sw/spl/Help/Image/insertionSort-A.svg)

* * *

See also: insertionSortMatrix, mergeSort, quickSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Insertion_sort)
