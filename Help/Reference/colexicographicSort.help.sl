# colexicographicSort (colexicographicSort!)

- _colexicographicSort([x₁ x₂ …])_

Sorts a list _xₙ_ into colexicographic order.
There are copying and in-place forms.
Answer the sorted list.
This is `sortComparing` of `colexicographicCompare`.

Sort subsets colexicographically:

```
>>> let x = [1 2 3].powerSet;
>>> let y = x.colexicographicSort!;
>>> (x, x == y)
([; 1; 2; 1 2; 3; 1 3; 2 3; 1 2 3], true)
```

Sort k-subsets of first n integers colexicographically:

```
>>> let n = 5;
>>> let k = 3;
>>> 1:n.combinations(k)
>>> .colexicographicSort!
[
	1 2 3;
	1 2 4;
	1 3 4;
	2 3 4;
	1 2 5;
	1 3 5;
	2 3 5;
	1 4 5;
	2 4 5;
	3 4 5
]
```

Sort binary combinations:

```
>>> binaryCombinations(2, 3)
>>> .colexicographicSort!
[
	1 1 1 0 0;
	1 1 0 1 0;
	1 0 1 1 0;
	0 1 1 1 0;
	1 1 0 0 1;
	1 0 1 0 1;
	0 1 1 0 1;
	1 0 0 1 1;
	0 1 0 1 1;
	0 0 1 1 1
]
```

Colexicographic sort of the integer partitions of six:

```
>>> 6.integerPartitions
>>> .padRight
>>> .colexicographicSort!
[
	6 0 0 0 0 0;
	5 1 0 0 0 0;
	4 2 0 0 0 0;
	3 3 0 0 0 0;
	4 1 1 0 0 0;
	3 2 1 0 0 0;
	2 2 2 0 0 0;
	3 1 1 1 0 0;
	2 2 1 1 0 0;
	2 1 1 1 1 0;
	1 1 1 1 1 1
]
```

Colexicographic sort of the 5-cycle permutations of _1:5_:

```
>>> [1 .. 5].permutations.select { :p |
>>> 	p.isCyclicPermutation(5)
>>> }.colexicographicSort!
[
	3 5 4 2 1;
	4 3 5 2 1;
	4 5 2 3 1;
	2 4 5 3 1;
	3 4 2 5 1;
	2 3 4 5 1;
	5 3 4 1 2;
	3 4 5 1 2;
	5 4 1 3 2;
	4 1 5 3 2;
	4 3 1 5 2;
	3 1 4 5 2;
	5 4 2 1 3;
	2 5 4 1 3;
	4 5 1 2 3;
	5 1 4 2 3;
	2 4 1 5 3;
	4 1 2 5 3;
	3 5 2 1 4;
	2 3 5 1 4;
	5 3 1 2 4;
	3 1 5 2 4;
	2 5 1 3 4;
	5 1 2 3 4
]
```

Walsh functions in colexicographic order:

~~~spl svg=A
let m = (2 ^ 4).walshMatrix;
(1 - m.unitStep)
.colexicographicSort!
.matrixPlot
~~~

![](Help/Image/colexicographicSort-A.svg)

Integer partitions in colexicographical ordering,
OEIS [A211992](https://oeis.org/A211992):

~~~spl svg=B oeis=A211992
1:8.collect { :n |
	n.integerPartitions
	.colexicographicSort!
}.catenate.catenate.scatterPlot
~~~

![](Help/Image/colexicographicSort-B.svg)

* * *

See also: canonicalSort, lexicographicSort, sort

Guides: Sort Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Colexicographical_order)
