# integerPartitions

- _integerPartitions(n)_
- _integerPartitions(n, [k…])_

Answer a `List` of all possible ways to partition the integer _n_ into smaller integers.
The binary form only answers partitions of size _k_.

All five partitions of four:

```
>>> 4.integerPartitions
[4; 3 1; 2 2; 2 1 1; 1 1 1 1]

>>> 4.partitionFunctionP
5
```

All seven partitions of five:

```
>>> 5.integerPartitions
[
	5;
	4 1;
	3 2;
	3 1 1;
	2 2 1;
	2 1 1 1;
	1 1 1 1 1
]

>>> 5.partitionFunctionP
7
```

Canonical order,
OEIS [A334301](https://oeis.org/A334301):

```
>>> 1:6.collect { :n |
>>> 	n.integerPartitions
>>> 	.canonicalSort
>>> }
[
	1
	:;
	2; 1 1
	:;
	3; 2 1; 1 1 1
	:;
	4; 2 2; 3 1; 2 1 1; 1 1 1 1
	:;
	5; 3 2; 4 1; 2 2 1; 3 1 1; 2 1 1 1;
	1 1 1 1 1
	:;
	6; 3 3; 4 2; 5 1; 2 2 2; 3 2 1; 4 1 1;
	2 2 1 1; 3 1 1 1; 2 1 1 1 1; 1 1 1 1 1 1
]
```

In ascending order:

```
>>> 5.integerPartitions.sort(<|)
[
	1 1 1 1 1;
	2 1 1 1;
	2 2 1;
	3 1 1;
	3 2;
	4 1;
	5
]

>>> 5.integerPartitionsAscending
[
	1 1 1 1 1;
	1 1 1 2;
	1 1 3;
	1 2 2;
	1 4;
	2 3;
	5
]
```

All eleven partitions of six:

```
>>> 6.integerPartitions
[
	6;
	5 1;
	4 2; 4 1 1;
	3 3; 3 2 1; 3 1 1 1;
	2 2 2; 2 2 1 1; 2 1 1 1 1;
	1 1 1 1 1 1
]

>>> 6.partitionFunctionP
11
```

Count the number of partitions of twenty,
this number is given by `partitionFunctionP`:

```
>>> 20.integerPartitions.size
627

>>> 20.partitionFunctionP
627
```

Partitions of eight into at most three integers:

```
>>> 8.integerPartitions(1:3)
[
	8;
	7 1;
	6 2;
	5 3;
	4 4;
	6 1 1;
	5 2 1;
	4 3 1;
	4 2 2;
	3 3 2
]
```

The five partitions of eight into exactly three integers:

```
>>> 8.integerPartitions([3])
[6 1 1; 5 2 1; 4 3 1; 4 2 2; 3 3 2]

>>> 8.partitionFunctionP(3)
5
```

Find all partitions of eight that involve only _(1,2,5)_:

```
>>> 8.integerPartitions.select { :each |
>>> 	each.includesOnly([1 2 5])
>>> }
[
	5 2 1;
	5 1 1 1;
	2 2 2 2;
	2 2 2 1 1;
	2 2 1 1 1 1;
	2 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1
]
```

Find partitions of six of even length only:

```
>>> 6.integerPartitions.select { :each |
>>> 	each.size.isEven
>>> }
[
	5 1; 4 2; 3 3;
	3 1 1 1; 2 2 1 1;
	1 1 1 1 1 1
]
```

The 22 partitions of 19 into 11 parts in lexicographic order:

```
>>> integerPartitions(19, [11])
>>> .collect(reverse:/1)
>>> .lexicographicSort
[
	1 1 1 1 1 1 1 1 1 1 9;
	1 1 1 1 1 1 1 1 1 2 8;
	1 1 1 1 1 1 1 1 1 3 7;
	1 1 1 1 1 1 1 1 1 4 6;
	1 1 1 1 1 1 1 1 1 5 5;
	1 1 1 1 1 1 1 1 2 2 7;
	1 1 1 1 1 1 1 1 2 3 6;
	1 1 1 1 1 1 1 1 2 4 5;
	1 1 1 1 1 1 1 1 3 3 5;
	1 1 1 1 1 1 1 1 3 4 4;
	1 1 1 1 1 1 1 2 2 2 6;
	1 1 1 1 1 1 1 2 2 3 5;
	1 1 1 1 1 1 1 2 2 4 4;
	1 1 1 1 1 1 1 2 3 3 4;
	1 1 1 1 1 1 1 3 3 3 3;
	1 1 1 1 1 1 2 2 2 2 5;
	1 1 1 1 1 1 2 2 2 3 4;
	1 1 1 1 1 1 2 2 3 3 3;
	1 1 1 1 1 2 2 2 2 2 4;
	1 1 1 1 1 2 2 2 2 3 3;
	1 1 1 1 2 2 2 2 2 2 3;
	1 1 1 2 2 2 2 2 2 2 2
]
```

Number of partitions of _n_ into an odd number of parts,
OEIS [A027193](https://oeis.org/A027193):

```
>>> 1:16.collect { :n |
>>> 	n.integerPartitions
>>> 	.select { :p |
>>> 		p.size.isOdd
>>> 	}.size
>>> }
[1 1 2 2 4 5 8 10 16 20 29 37 52 66 90 113]
```

Number of partitions of _n_ into an even number of parts,
OEIS [A027187](https://oeis.org/A027187):

```
>>> 1:16.collect { :n |
>>> 	n.integerPartitions
>>> 	.select { :p |
>>> 		p.size.isEven
>>> 	}.size
>>> }
[0 1 1 3 3 6 7 12 14 22 27 40 49 69 86 118]
```

Partitions in graded reflected colexicographic order (Abramowitz and Stegun),
OEIS [A036036](https://oeis.org/A036036):

```
>>> 1:6.collect { :n |
>>> 	n.integerPartitions
>>> }.catenate
>>> .gradedReflectedColexicographicSort
[
	1;
	2;
	1 1;
	3;
	1 2;
	1 1 1;
	4;
	1 3;
	2 2;
	1 1 2;
	1 1 1 1;
	5;
	1 4;
	2 3;
	1 1 3;
	1 2 2;
	1 1 1 2;
	1 1 1 1 1;
	6;
	1 5;
	2 4;
	3 3;
	1 1 4;
	1 2 3;
	2 2 2;
	1 1 1 3;
	1 1 2 2;
	1 1 1 1 2;
	1 1 1 1 1 1
]
```

Plot first few terms of
OEIS [A036036](https://oeis.org/A036036):

~~~spl svg=A
1:8.collect { :n |
	n.integerPartitions
}.catenate
.gradedReflectedColexicographicSort
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitions-A.svg)

Partitions in graded reverse lexicographic ordering (Mathematica),
OEIS [A080577](https://oeis.org/A080577):

```
>>> 1:6.collect { :n |
>>> 	n.integerPartitions
>>> }.catenate
>>> .gradedReverseLexicographicSort
[
	1;
	2;
	1 1;
	3;
	2 1;
	1 1 1;
	4;
	3 1;
	2 2;
	2 1 1;
	1 1 1 1;
	5;
	4 1;
	3 2;
	3 1 1;
	2 2 1;
	2 1 1 1;
	1 1 1 1 1;
	6;
	5 1;
	4 2;
	4 1 1;
	3 3;
	3 2 1;
	3 1 1 1;
	2 2 2;
	2 2 1 1;
	2 1 1 1 1;
	1 1 1 1 1 1
]
```

Plot first few terms of
OEIS [A080577](https://oeis.org/A080577):

~~~spl svg=B
1:8.collect { :n |
	n.integerPartitions
}.catenate
.gradedReverseLexicographicSort
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitions-B.svg)

Partitions in graded reflected lexicographic order (Maple),
OEIS [A080576](https://oeis.org/A080576):

```
>>> 1:6.collect { :n |
>>> 	n.integerPartitions
>>> }.catenate
>>> .gradedReflectedLexicographicSort
[
	1;
	1 1;
	2;
	1 1 1;
	1 2;
	3;
	1 1 1 1;
	1 1 2;
	2 2;
	1 3;
	4;
	1 1 1 1 1;
	1 1 1 2;
	1 2 2;
	1 1 3;
	2 3;
	1 4;
	5;
	1 1 1 1 1 1;
	1 1 1 1 2;
	1 1 2 2;
	2 2 2;
	1 1 1 3;
	1 2 3;
	3 3;
	1 1 4;
	2 4;
	1 5;
	6
]
```

Plot first few terms of
OEIS [A080576](https://oeis.org/A080576):

~~~spl svg=C
1:8.collect { :n |
	n.integerPartitions
}.catenate
.gradedReflectedLexicographicSort
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitions-C.svg)

Partitions in graded lexicographical ordering,
OEIS [A193073](https://oeis.org/A193073):

```
>>> 1:6.collect { :n |
>>> 	n.integerPartitions
>>> }.catenate
>>> .gradedLexicographicSort
[
	1;
	1 1;
	2;
	1 1 1;
	2 1;
	3;
	1 1 1 1;
	2 1 1;
	2 2;
	3 1;
	4;
	1 1 1 1 1;
	2 1 1 1;
	2 2 1;
	3 1 1;
	3 2;
	4 1;
	5;
	1 1 1 1 1 1;
	2 1 1 1 1;
	2 2 1 1;
	2 2 2;
	3 1 1 1;
	3 2 1;
	3 3;
	4 1 1;
	4 2;
	5 1;
	6
]
```

Plot first few terms of
OEIS [A193073](https://oeis.org/A193073):

~~~spl svg=D
1:8.collect { :n |
	n.integerPartitions
}.catenate
.gradedLexicographicSort
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitions-D.svg)

Partitions in graded colexicographical ordering,
OEIS [A036037](https://oeis.org/A036037):

```
>>> 1:6.collect { :n |
>>> 	n.integerPartitions
>>> }.catenate
>>> .gradedColexicographicSort
[
	1;
	2;
	1 1;
	3;
	2 1;
	1 1 1;
	4;
	3 1;
	2 2;
	2 1 1;
	1 1 1 1;
	5;
	4 1;
	3 2;
	3 1 1;
	2 2 1;
	2 1 1 1;
	1 1 1 1 1;
	6;
	5 1;
	4 2;
	3 3;
	4 1 1;
	3 2 1;
	2 2 2;
	3 1 1 1;
	2 2 1 1;
	2 1 1 1 1;
	1 1 1 1 1 1
]
```

Plot first few terms of
OEIS [A036037](https://oeis.org/A036037):

~~~spl svg=E
1:8.collect { :n |
	n.integerPartitions
}.catenate
.gradedColexicographicSort
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/integerPartitions-E.svg)

* * *

See also: integerPartitionsOdd, integerPartitionsStrict, integerPartitionsTable, partitionFunctionP, partitionFunctionQ, qBinomial, setPartitions

Guides: Combinatorial Functions, Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Partition.html)
[2](https://reference.wolfram.com/language/ref/IntegerPartitions.html),
_OEIS_
[1](https://oeis.org/A036036)
[2](https://oeis.org/A036037)
[3](https://oeis.org/A080576)
[4](https://oeis.org/A080577)
[5](https://oeis.org/A193073)
[6](https://oeis.org/A334301)
[7](https://oeis.org/wiki/Orderings_of_partitions),
_W_
[1](https://en.wikipedia.org/wiki/Integer_partition)

Categories: Math, Combinatorics
