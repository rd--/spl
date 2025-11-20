# integerPartitionsStrict

- _integerPartitionsStrict(n)_

Answer a `List` of all possible ways to partition the integer _n_ into smaller integers without repetitions.

The two strict partitions of four:

```
>>> 4.integerPartitionsStrict
[
	4;
	3 1
]

>>> 4.partitionFunctionQ
2
```

The three strict partitions of five:

```
>>> 5.integerPartitionsStrict
[
	5;
	4 1;
	3 2
]

>>> 5.partitionFunctionQ
3
```

The four strict partitions of six:

```
>>> 6.integerPartitionsStrict
[
	6;
	5 1;
	4 2;
	3 2 1
]

>>> 6.partitionFunctionQ
4
```

The six strict partitions of eight:

```
>>> 8.integerPartitionsStrict
[
	8;
	7 1;
	6 2;
	5 3;
	5 2 1;
	4 3 1
]

>>> 8.partitionFunctionQ
6
```

Count the number of strict partitions of twenty,
this number is given by `partitionFunctionQ`:

```
>>> 20.integerPartitionsStrict.size
64

>>> 20.partitionFunctionQ
64
```

* * *

See also: integerPartitions, integerPartitionsOdd, partitionFunctionQ

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Partition.html),
_W_
[1](https://en.wikipedia.org/wiki/Integer_partition)

Categories: Math, Combinatorics
