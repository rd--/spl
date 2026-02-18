# guyShuffle

- _guyShuffle([x₁ x₂ …])_

Implement the algorithm from Guy’s shuffling problem.

Relevant part of deck in at each step,
OEIS [A035491](https://oeis.org/A035491):

```
>>> guyShuffle:/1.nestList([], 8)
[
	;
	2 1;
	3 2 4 1;
	1 3 5 2 6 4;
	6 1 4 3 7 5 8 2;
	5 6 8 1 2 4 9 3 10 7;
	9 5 3 6 10 8 7 1 11 2 12 4;
	1 9 11 5 2 3 12 6 4 10 13 8 14 7;
	4 1 10 9 13 11 8 5 14 2 7 3 15 12 16 6
]
```

Card on top of deck at _n_-th stage,
OEIS [A035485](https://oeis.org/A035485)

```
>>> guyShuffle:/1.nestList([2 1], 16)
>>> .collect(first:/1)
[2 3 1 6 5 9 1 4 2 16 10 12 14 23 16 18 20]
```

Step at which card _n_ appears on top of deck for first time,
OEIS [A035490](https://oeis.org/A060750):

```
>>> 2:16.collect { :i |
>>> 	guyShuffle:/1
>>> 	.fixedPoint([]) { :p :q |
>>> 		q[1] = i
>>> 	}.size // 2
>>> }
[1 2 8 5 4 78 37 6 11 28 12 349 13 383 10]
```

Plot
OEIS [A035491](https://oeis.org/A035491):

~~~spl svg=A
guyShuffle:/1.nestList([], 15)
.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/guyShuffle-A.svg)

* * *

See also: inShuffle, outShuffle

Guides: Permutation Functions
