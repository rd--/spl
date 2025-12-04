# shuffleSort

- _shuffleSort([x₁ x₂ …], f:/2)_

Sort the sequence _x_ in place using the shuffle sort algorithm.
according to the comparison predicate _f_.

Sort list:

```
>>> [1 3 5 2 4 3].shuffleSort
[1 2 3 3 4 5]

>>> [1 3 5 2 4 3].shuffleSort(>)
[5 4 3 3 2 1]

>>> [].shuffleSort
[]

>>> [1].shuffleSort
[1]
```

Sort is in place:

```
>>> let s = [1 3 5 2 4 3];
>>> let t = s.shuffleSort;
>>> (t, t == s)
([1 2 3 3 4 5], true)
```

All permutations of a list sort to the same list:

```
>>> let n = 4;
>>> [1 .. n].permutations.allSatisfy { :x |
>>> 	x.shuffleSort = [1 .. 4]
>>> }
true
```

Show every _k_-th comparison made in doing a sort:

~~~spl svg=A
let n = 50;
let m = 50;
let k = 4;
let r = [];
0:n.collect { :x |
	(x.sin * m).round
}.shuffleSort { :a :b |
	r.add(a);
	a > b
};
r.downsample(k).scatterPlot
~~~

![](sw/spl/Help/Image/shuffleSort-A.svg)

* * *

See also: shuffleSortMatrix, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Shuffle_sort)
