# quickSort

- _quickSort([x₁ x₂ …], f:/2=≤)_

Sort elements of the sequence _x_ to be non-descending according to the sort block _f_,
using an in-place quicksort with simple median-of-three partitioning,
with guaranteed _O(log(n))_ space usage.

Sort two items in place:

```
>>> let l = [2 1];
>>> (l.quickSort == l, l)
(true, [1 2])
```

Sort three items:

```
>>> [3 2 1].quickSort
[1 2 3]
```

Sort more than three items:

```
>>> [5 4 3 2 1].quickSort
[1 2 3 4 5]
```

Sort a sorted sequence:

```
>>> [1 .. 99].quickSort
[1 .. 99]
```

Sort a descending sequence:

```
>>> [99 .. 1].quickSort
[1 .. 99]
```

Sort a random sequence of integers:

```
>>> Sfc32(24015)
>>> .randomInteger([1 23], [16])
>>> .quickSort
[1 3 3 6 7 8 9 10 10 12 13 15 17 18 21 23]
```

Show comparisons made in doing a sort:

~~~spl svg=A
let n = 150;
let m = 50;
let r = [];
0:n.collect { :x |
	(x.sin * m).rounded
}.quickSort { :a :b |
	r.add(a);
	a > b
};
r.downsample(4).scatterPlot
~~~

![](sw/spl/Help/Image/quickSort-A.svg)

* * *

See also: isSorted, quickSortBy, quickSortByFromTo, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Quicksort)

Categories: Sorting
