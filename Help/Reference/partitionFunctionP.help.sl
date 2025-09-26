# partitionFunctionP

- _partitionFunctionP(n)_
- _partitionFunctionP(n, k)_

The unary form answers the number of unrestricted partitions of the `Integer` _n_.

The binary form denotes the number of ways of writing _n_ as a `sum` of exactly _k_ terms
or, equivalently, the number of partitions into parts of which the largest is exactly _k_.

First few terms of OEIS [A000041](https://oeis.org/A000041):

```
>>> 0:15.collect(partitionFunctionP:/1)
[
	1 1 2 3 5 7 11 15 22 30
	42 56 77 101 135 176
]
```

Specific values:

```
>>> 100.partitionFunctionP
190569292

>>> 121.partitionFunctionP
2056148051

>>> 666.partitionFunctionP
11956824258286445517629485L

>>> 1000.partitionFunctionP
24061467864032622473692149727991L
```

`partitionFunctionP` gives the length of `integerPartitions`:

```
>>> 5.integerPartitions
[5; 4 1; 3 2; 3 1 1; 2 2 1; 2 1 1 1; 1 1 1 1 1]

>>> 5.partitionFunctionP
7
```

Initial triangle of _P(n,k)_,
OEIS [A008284](https://oeis.org/A008284):

```
>>> 1:9.collect { :n |
>>> 	1:n.collect { :k |
>>> 		n.partitionFunctionP(k)
>>> 	}
>>> }
[
	1;
	1 1;
	1 1 1;
	1 2 1 1;
	1 2 2 1 1;
	1 3 3 2 1 1;
	1 3 4 3 2 1 1;
	1 4 5 5 3 2 1 1;
	1 4 7 6 5 3 2 1 1
]
```

Initial triangle of _P(n,1:k)_,
OEIS [A026820](https://oeis.org/A026820):

```
>>> 1:10.collect { :n |
>>> 	1:n.collect { :k |
>>> 		1:k.sum { :i |
>>> 			n.partitionFunctionP(i)
>>> 		}
>>> 	}
>>> }
[
	1;
	1 2;
	1 2 3;
	1 3 4 5;
	1 3 5 6 7;
	1 4 7 9 10 11;
	1 4 8 11 13 14 15;
	1 5 10 15 18 20 21 22;
	1 5 12 18 23 26 28 29 30;
	1 6 14 23 30 35 38 40 41 42
]
```

Plot the number of unrestricted partitions:

~~~spl svg=A
0:50.functionPlot { :x |
	x.partitionFunctionP.log10
}
~~~

![](sw/spl/Help/Image/partitionFunctionP-A.svg)

* * *

See also: integerPartitions, partitionFunctionQ, partitionsP

Guides: Combinatorial Functions, Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PartitionFunctionP.html)
[2](https://reference.wolfram.com/language/ref/PartitionsP.html),
_OEIS_
[1](https://oeis.org/A000041)
[2](https://oeis.org/A008284)
[3](https://oeis.org/A026820),
_W_
[1](https://en.wikipedia.org/wiki/Partition_function_(number_theory))

Categories: Math, Combinatorics
