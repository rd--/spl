# oddEvenSort

- _oddEvenSort([x₁ x₂ …], f:/2)_

Sort the sequence _x_ in place using the odd-even sort algorithm,
according to the comparison predicate _f_.

Sort list:

```
>>> [1 3 5 2 4 3].oddEvenSort
[1 2 3 4 5]

>>> [1 3 5 2 4 3].oddEvenSort(>)
[5 4 3 3 2 1]
```

Sort is in place:

```
>>> let s = [1 3 5 2 4];
>>> let t = s.oddEvenSort;
>>> (t, t == s)
([1 2 3 4 5], true)
```

Show every _k_-th comparison made in doing a sort:

~~~spl svg=A
let n = 50;
let m = 50;
let k = 4;
let r = [];
0:n.collect { :x |
	(x.sin * m).round
}.oddEvenSort { :a :b |
	r.add(a);
	a > b
};
r.downsample(k).scatterPlot
~~~

![](sw/spl/Help/Image/oddEvenSort-A.svg)

* * *

See also: oddEvenSortMatrix, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Odd-even_sort)

Further Reading: Habermanm 1972
