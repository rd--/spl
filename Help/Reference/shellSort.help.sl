# shellSort

- _shellSort([x₁ x₂ …], t=[5 3 1], f:/2)_

Sort the sequence _x_ in place using the shell sort algorithm,
according to the comparison predicate _f_.

Sort list:

```
>>> [1 3 5 2 4 3].shellSort
[1 2 3 3 4 5]

>>> [1 3 5 2 4 3].shellSort([5 3 1], >)
[5 4 3 3 2 1]
```

Sort is in place:

```
>>> let s = [1 3 5 2 4 3];
>>> let t = s.shellSort;
>>> (t, t == s)
([1 2 3 3 4 5], true)
```

Show every _k_-th comparison made in doing a sort:

~~~spl svg=A
let n = 125;
let m = 50;
let k = 4;
let r = [];
0:n.collect { :x |
	(x.sin * m).round
}.shellSort([57 23 10 4 1]) { :a :b |
	r.add(a);
	a > b
};
r.downsample(k).scatterPlot
~~~

![](sw/spl/Help/Image/shellSort-A.svg)

* * *

See also: shellSortMatrix, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Shell_sort)

Further Reading: Shell 1959
