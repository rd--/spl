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

* * *

See also: integerPartitionsOdd, integerPartitionsStrict, integerPartitionsTable, partitionFunctionP, partitionFunctionQ, qBinomial, setPartitions

Guides: Combinatorial Functions, Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Partition.html)
[2](https://reference.wolfram.com/language/ref/IntegerPartitions.html),
_W_
[1](https://en.wikipedia.org/wiki/Integer_partition)

Categories: Math, Combinatorics
