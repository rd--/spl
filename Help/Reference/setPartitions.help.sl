# setPartitions

- _setPartitions(n, k)_

Answer the partitions of the set _1,2…n_ into _k_ parts.

The three partitions of a three element set into two parts:

```
>>> setPartitions(3, 2)
[
	1 3; 2:;
	1; 2 3:;
	1 2; 3
]

>>> stirlingS2(3, 2)
3
```

The twenty-five partitions of a five element set into three parts:

```
>>> setPartitions(5, 3)
[
	1 4 5; 2; 3:;
	1 4; 2 5; 3:;
	1 4; 2; 3 5:;
	1 5; 2 4; 3:;
	1; 2 4 5; 3:;
	1; 2 4; 3 5:;
	1 5; 2; 3 4:;
	1; 2 5; 3 4:;
	1; 2; 3 4 5:;
	1 3 5; 2; 4:;
	1 3; 2 5; 4:;
	1 3; 2; 4 5:;
	1 5; 2 3; 4:;
	1; 2 3 5; 4:;
	1; 2 3; 4 5:;
	1 2 5; 3; 4:;
	1 2; 3 5; 4:;
	1 2; 3; 4 5:;
	1 3 4; 2; 5:;
	1 3; 2 4; 5:;
	1 4; 2 3; 5:;
	1; 2 3 4; 5:;
	1 2 4; 3; 5:;
	1 2; 3 4; 5:;
	1 2 3; 4; 5
]

>>> stirlingS2(5, 3)
25
```

* * *

See also: bellNumber, integerPartitions, stirlingS2

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SetPartition.html),
_W_
[1](https://en.wikipedia.org/wiki/Partition_of_a_set)
