# partitionFunctionQ

- _partitionFunctionQ(n)_
- _partitionFunctionQ(n, k)_

Denotes the number of ways of partitioning _n_ into exactly _k_ distinct parts.

For example,
_Q(10,3)=4_,
since there are four partitions of 10 into three distinct parts:
{1,2,7}, {1,3,6}, {1,4,5}, and {2,3,5}.

```
>>> 10.partitionFunctionQ(3)
4

>>> let n = 10;
>>> let k = 3;
>>> let p = n.integerPartitions([k]);
>>> p.collect(nub:/1).select { :each |
>>> 	each.size = k
>>> }
[
	7 2 1;
	6 3 1;
	5 4 1;
	5 3 2
]
```

First few terms,
OEIS [A000009](https://oeis.org/A000009):

```
>>> 0:39.collect(partitionFunctionQ:/1)
[
	  1   1   1   2   2
	  3   4   5   6   8
	 10  12  15  18  22
	 27  32  38  46  54
	 64  76  89 104 122
	142 165 192 222 256
	296 340 390 448 512
	585 668 760 864 982
]
```

The following table gives the first few values of _Q(n,k)_,
OEIS [A008289](https://oeis.org/A008289):

```
>>> 1:10.collect { :n |
>>> 	1:n.collect { :k |
>>> 		n.partitionFunctionQ(k)
>>> 	}.select { :i |
>>> 		i > 0
>>> 	}
>>> }
[
	1;
	1;
	1 1;
	1 1;
	1 2;
	1 2 1;
	1 3 1;
	1 3 2;
	1 4 3;
	1 4 4 1
]
```

Maximal value of _Q(n,m)_,
[A030699](https://oeis.org/A030699):

```
>>> 1:29.collect { :n |
>>> 	1:n.collect { :k |
>>> 		n.partitionFunctionQ(k)
>>> 	}.max
>>> }
[
	 1  1  1  1  2  2  3  3  4  4
	 5  7  8 10 12 14 16 19	21 24
	27 34 39 47 54 64 72 84 94
]
```

Plot table:

~~~spl svg=A
1:21.collect { :n |
	1:n.collect { :k |
		n.partitionFunctionQ(k)
	}.select { :i |
		i > 0
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/partitionFunctionQ-A.svg)

Plot table log scaled:

~~~spl svg=B
1:43.collect { :n |
	1:n.collect { :k |
		n.partitionFunctionQ(k)
	}.select { :i |
		i > 0
	}
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/partitionFunctionQ-B.svg)

* * *

See also: integerPartitions, partitionFunctionP, partitionsQ

Guides: Combinatorial Functions, Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PartitionFunctionQ.html)
[2](https://reference.wolfram.com/language/ref/PartitionsQ.html),
_OEIS_
[1](https://oeis.org/A000009)
[2](https://oeis.org/A008289)
[3](https://oeis.org/A030699),
_W_
[1](https://en.wikipedia.org/wiki/Partition_function_(number_theory))

Categories: Math, Combinatorics
