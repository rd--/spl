# integerPartitionsOdd

- _integerPartitionsOdd(n)_

Answer a `List` of all possible ways to partition the integer _n_ into smaller odd integers.

The two odd partitions of four:

```
>>> 4.integerPartitionsOdd
[3 1; 1 1 1 1]

>>> 4.partitionFunctionQ
2
```

The three odd partitions of five:

```
>>> 5.integerPartitionsOdd
[5; 3 1 1; 1 1 1 1 1]

>>> 5.partitionFunctionQ
3
```

The four odd partitions of six:

```
>>> 6.integerPartitionsOdd
[5 1; 3 3; 3 1 1 1; 1 1 1 1 1 1]

>>> 6.partitionFunctionQ
4
```

The six odd partitions of eight:

```
>>> 8.integerPartitionsOdd
[
	7 1;
	5 3;
	5 1 1 1;
	3 3 1 1;
	3 1 1 1 1 1;
	1 1 1 1 1 1 1 1
]

>>> 8.partitionFunctionQ
6
```

The eight odd partitions of nine:

```
>>> 9.integerPartitionsOdd
[
	9;
	7 1 1;
	5 3 1;
	5 1 1 1 1;
	3 3 3;
	3 3 1 1 1;
	3 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1 1
]

>>> 9.partitionFunctionQ
8
```

Count the number of odd partitions of twenty,
this number is given by `partitionFunctionQ`:

```
>>> 20.integerPartitionsOdd.size
64

>>> 20.partitionFunctionQ
64
```

* * *

See also: integerPartitions, integerPartitionsStrict, partitionFunctionQ

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Partition.html),
_W_
[1](https://en.wikipedia.org/wiki/Integer_partition)

Categories: Math, Combinatorics
