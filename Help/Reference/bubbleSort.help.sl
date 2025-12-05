# bubbleSort

- _bubbleSort([x₁ x₂ …], f:/2)_

Sort the sequence _x_ in place using the bubble sort algorithm,
according to the comparison predicate _f_.

Sort list:

```
>>> [1 3 5 2 4 3].bubbleSort
[1 2 3 3 4 5]

>>> [1 3 5 2 4 3].bubbleSort(>)
[5 4 3 3 2 1]

>>> [].bubbleSort
[]

>>> [1].bubbleSort
[1]
```

Sort is in place:

```
>>> let s = [1 3 5 2 4 3];
>>> let t = s.bubbleSort;
>>> (t, t == s)
([1 2 3 3 4 5], true)
```

All permutations of a list sort to the same list:

```
>>> let n = 4;
>>> [1 .. n].permutations.allSatisfy { :x |
>>> 	x.bubbleSort = [1 .. 4]
>>> }
true
```

Show every _k_-th comparison made in doing a sort:

~~~spl svg=A
let n = 20;
let m = 50;
let k = 4;
let r = [];
0:n.collect { :x |
	(x.sin * m).round
}.bubbleSort { :a :b |
	r.add(a);
	a > b
};
r.scatterPlot
~~~

![](sw/spl/Help/Image/bubbleSort-A.svg)

* * *

See also: bubbleSortMatrix, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Bubble_sort)

Further Reading: Friend 1956
