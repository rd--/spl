# integerPartitions

- _integerPartitions(n)_
- _integerPartitions(n, k)_

Answer a `List` of all possible ways to partition the integer _n_ into smaller integers.
The binary form only answers partitions of size _k_.

All partitions of 5:

```
>>> 5.integerPartitions
[5; 4 1; 3 2; 3 1 1; 2 2 1; 2 1 1 1; 1 1 1 1 1]
```

In ascending order:

```
>>> 5.integerPartitionsAscending
[1 1 1 1 1; 1 1 1 2; 1 1 3; 1 2 2; 1 4; 2 3; 5]
```

All partitions of 6:

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
```

The number of partitions of 20:

```
>>> 20.integerPartitions.size
627
```

This number is given by _partitionFunctionP_:

```
>>> 20.partitionFunctionP
627
```

Partitions of 8 into at most 3 integers:

```
>>> 1:3.collect { :k | 8.integerPartitions(k) }.++
[8; 7 1; 6 2; 5 3; 4 4; 6 1 1; 5 2 1; 4 3 1; 4 2 2; 3 3 2]
```

Partitions of 8 into exactly 3 integers:

```
>>> 8.integerPartitions(3)
[6 1 1; 5 2 1; 4 3 1; 4 2 2; 3 3 2]
```

Find all partitions of 8 that involve only 1, 2, and 5:

```
>>> 8.integerPartitions.select { :each |
>>> 	each.allSatisfy { :n | [1 2 5].includes(n) }
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

Find partitions of 6 of even length only:

```
>>> 6.integerPartitions.select { :each | each.size.isEven }
[5 1; 4 2; 3 3; 3 1 1 1; 2 2 1 1; 1 1 1 1 1 1]
```

* * *

See also: partitionFunctionP, partitionFunctionQ

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PartitionFunctionq.html)
[2](https://reference.wolfram.com/language/ref/IntegerPartitions.html)

Categories: Math, Combinatorics
