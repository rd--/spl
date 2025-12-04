# bitonicSort

- _bitonicSort([x₁ x₂ …], f:/2)_

Sort the sequence _x_ in place using the bitonic sort algorithm,
according to the comparison predicate _f_.
The sequence must be a permutation list.

Sort list:

```
>>> [1 3 5 2 4 7 8 6]
>>> .bitonicSort
[1 2 3 4 5 6 7 8]

>>> [1 3 5 2 4 7 8 6]
>>> .bitonicSort(>)
[8 7 6 5 4 3 2 1]
```

Sort is in place:

```
>>> let s = [1 3 5 2 4 7 8 6];
>>> let t = s.bitonicSort;
>>> (t, t == s)
([1 2 3 4 5 6 7 8], true)
```

Show every _k_-th comparison made in doing a sort:

~~~spl svg=A
let n = 64;
let m = 50;
let k = 4;
let r = [];
(0 .. n - 1).collect { :x |
	(x.sin * m).round
}.bitonicSort { :a :b |
	r.add(a);
	a > b
};
r.downsample(k).scatterPlot
~~~

![](sw/spl/Help/Image/bitonicSort-A.svg)

* * *

See also: bitonicSortMatrix, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Bitonic_sorter)

Further Reading: Batcher 1968
