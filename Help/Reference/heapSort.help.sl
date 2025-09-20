# heapSort

- _heapSort([x₁ x₂ …], f:/2=≤)_

Answer a `List` having the elements of the collection _c_ in sorted sequence,
implemented using the heap sort algorithm.

Sort a list

```
>>> [1 3 5 7 9 2 4 6 8 0].heapSort
[0 1 2 3 4 5 6 7 8 9]
```

Show comparisons made in doing a sort:

~~~spl svg=A
let n = 100;
let m = 25;
let r = [];
0:n.collect { :x |
	(x.sin * m).round
}.heapSortBy { :a :b |
	r.add(a);
	a > b
};
r.downsample(4).scatterPlot
~~~

![](sw/spl/Help/Image/heapSort-A.svg)

* * *

See also: Heap

Guides: Sort Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Heapsort.html),
_W_
[1](https://en.wikipedia.org/wiki/Heapsort)
