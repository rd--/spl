# integerPartitionUnrank

- _integerPartitionUnrank(n, m)_

Answer the _n_-th integer partition according to the ranking method _m_.

With _m=Heinz_,
OEIS [A112798](https://oeis.org/A112798):

```
>>> let m = 'HeinzAscending';
>>> 2:28.collect { :n |
>>> 	n.integerPartitionUnrank(m)
>>> }
[
	1;
	2;
	1 1;
	3;
	1 2;
	4;
	1 1 1;
	2 2;
	1 3;
	5;
	1 1 2;
	6;
	1 4;
	2 3;
	1 1 1 1;
	7;
	1 2 2;
	8;
	1 1 3;
	2 4;
	1 5;
	9;
	1 1 1 2;
	3 3;
	1 6;
	2 2 2;
	1 1 4
]
```

With _m=Heinz_,
catenated digits,
OEIS [A087712](https://oeis.org/A087712):

```
>>> let m = 'HeinzAscending';
>>> 2:35.collect { :n |
>>> 	n.integerPartitionUnrank(m)
>>> 	.fromDigits
>>> }
[
	1 2 11 3 12 4 111 22 13 5 112 6 14 23
	1111 7 122 8 113 24 15 9 1112 33 16
	222 114 10 123 11 11111 25 17 34
]
```

With _m=Heinz_,
catenated reversed digits,
OEIS [A127668](https://oeis.org/A127668):

```
>>> let m = 'HeinzAscending';
>>> 2:35.collect { :n |
>>> 	n.integerPartitionUnrank(m)
>>> 	.reverse.fromDigits
>>> }
[
	1 2 11 3 21 4 111 22 31 5 211 6 41 32
	1111 7 221 8 311 42 51 9 2111 33 61
	222 411 10 321 11 11111 52 71 43
]
```

With _m=KarttunenAscending_,
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

Permute integers according to the sum of the Heinz partition,
OEIS [A215366](https://oeis.org/A215366):

~~~spl svg=C
let n = 8;
[1 .. 2 ^ n].gatherBy { :j |
	j.integerPartitionUnrank('Heinz')
	.sum
}.take(n + 1).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitionUnrank-C.svg)

Plot with _m=Heinz_,
OEIS [A112798](https://oeis.org/A112798):

~~~spl svg=D
let m = 'HeinzAscending';
2:67.collect { :n |
	n.integerPartitionUnrank(m)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitionUnrank-D.svg)

* * *

See also: integerPartitionRank, integerPartitions

Guides: Integer Functions

References:
_OEIS_
[1](https://oeis.org/A227739)
[2](https://oeis.org/A129594)
[3](https://oeis.org/A112798)
[4](https://oeis.org/A215366)
