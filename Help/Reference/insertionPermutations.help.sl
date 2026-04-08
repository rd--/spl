# insertionPermutations

- _insertionPermutations(n, k='FrontToBack')_

Answer the permutations of the integer sets of one through _n_ terms,
using the insertion algorithm.

Front-to-back insertion-permutation sequence,
OEIS [A098280](https://oeis.org/A098280):

```
>>> 4.insertionPermutations('FrontToBack')
[
	1
	:;
	2 1;
	1 2
	:;
	3 2 1;
	2 3 1;
	2 1 3;
	3 1 2;
	1 3 2;
	1 2 3
	:;
	4 3 2 1;
	3 4 2 1;
	3 2 4 1;
	3 2 1 4;
	4 2 3 1;
	2 4 3 1;
	2 3 4 1;
	2 3 1 4;
	4 2 1 3;
	2 4 1 3;
	2 1 4 3;
	2 1 3 4;
	4 3 1 2;
	3 4 1 2;
	3 1 4 2;
	3 1 2 4;
	4 1 3 2;
	1 4 3 2;
	1 3 4 2;
	1 3 2 4;
	4 1 2 3;
	1 4 2 3;
	1 2 4 3;
	1 2 3 4
]
```

Back-to-front insertion-permutation sequence,
OEIS [A098281](https://oeis.org/A098281):

```
>>> 4.insertionPermutations('BackToFront')
[
	1
	:;
	1 2;
	2 1
	:;
	1 2 3;
	1 3 2;
	3 1 2;
	2 1 3;
	2 3 1;
	3 2 1
	:;
	1 2 3 4;
	1 2 4 3;
	1 4 2 3;
	4 1 2 3;
	1 3 2 4;
	1 3 4 2;
	1 4 3 2;
	4 1 3 2;
	3 1 2 4;
	3 1 4 2;
	3 4 1 2;
	4 3 1 2;
	2 1 3 4;
	2 1 4 3;
	2 4 1 3;
	4 2 1 3;
	2 3 1 4;
	2 3 4 1;
	2 4 3 1;
	4 2 3 1;
	3 2 1 4;
	3 2 4 1;
	3 4 2 1;
	4 3 2 1
]
```

Front-to-back insertion-permutation sequence,
OEIS [A098280](https://oeis.org/A098280):

~~~spl svg=A oeis=A098280
4.insertionPermutations('FrontToBack')
.catenate.catenate.scatterPlot
~~~

![](Help/Image/insertionPermutations-A.svg)

Back-to-front insertion-permutation sequence,
OEIS [A098281](https://oeis.org/A098281):

~~~spl svg=B oeis=A098281
4.insertionPermutations('BackToFront')
.catenate.catenate.scatterPlot
~~~

![](Help/Image/insertionPermutations-B.svg)

* * *

See also: insertAt, lexicographicPermutations, permutations

Guides: Permutation Functions

References:
_OEIS_
[1](https://oeis.org/A098280)
[2](https://oeis.org/A098281)
