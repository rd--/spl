# combSort

- _combSort([x₁ x₂ …], f:/2)_

Sort the sequence _x_ in place using the comb sort algorithm,
according to the comparison predicate block _f_.

Sort list:

```
>>> [1 3 5 2 4 3].combSort
[1 2 3 3 4 5]

>>> [1 3 5 2 4 3].combSort(>)
[5 4 3 3 2 1]
```

Sort is in place:

```
>>> let s = [1 3 5 2 4 3];
>>> let t = s.combSort;
>>> (t, t == s)
([1 2 3 3 4 5], true)
```

Show every _k_-th comparison made in doing a sort:

~~~spl svg=A
let n = 80;
let m = 50;
let k = 4;
let r = [];
0:n.collect { :x |
	(x.sin * m).round
}.combSort { :a :b |
	r.add(a);
	a > b
};
r.downsample(k).scatterPlot
~~~

![](sw/spl/Help/Image/combSort-A.svg)

* * *

See also: combSortMatrix, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Comb_sort)

Further Reading: Dobosiewicz 1980
