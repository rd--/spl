# integerPartitionUnrank

- _integerPartitionUnrank(n, m)_

Answer the _n_-th integer partition according to the ranking method _m_.

The first few terms,
OEIS [A227739](https://oeis.org/A227739):

```
>>> let m = 'KarttunenAscending';
>>> 0:15.collect { :n |
>>> 	n.integerPartitionUnrank(m)
>>> }
[
	;
	1;
	1 1;
	2;
	2 2;
	1 1 1;
	1 2;
	3;
	3 3;
	1 2 2;
	1 1 1 1;
	2 2 2;
	2 3;
	1 1 2;
	1 3;
	4
]
```

Involution of nonnegative integers induced by the conjugation of the encoded partition,
OEIS [A129594](https://oeis.org/A129594):

```
>>> let m = 'Karttunen';
>>> 0:31.collect { :n |
>>> 	n.integerPartitionUnrank(m)
>>> 	.conjugatePartition
>>> 	.integerPartitionRank(m)
>>> }
[
	 0  1  3  2  4  7  6  5 11 12
	15  8  9 14 13 10 20 27 28 19
	16 31 24 23 22 25 30 17 18 29
	26 21
]
```

Plot first few terms:

~~~spl svg=A
let m = 'Karttunen';
0:255.collect { :n |
	n.integerPartitionUnrank(m)
	.conjugatePartition
	.integerPartitionRank(m)
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitionUnrank-A.svg)

Plot block _256:511_:

~~~spl svg=B
let m = 'Karttunen';
256:511.collect { :n |
	n.integerPartitionUnrank(m)
	.conjugatePartition
	.integerPartitionRank(m)
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitionUnrank-B.svg)

* * *

See also: integerPartitionRank, integerPartitions

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/x.html)
_OEIS
[1](https://oeis.org/A227739)
[2](https://oeis.org/A129594)
