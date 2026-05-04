# durfeeSquare

- _durfeeSquare(p)_

The length of the largest-sized square contained within the Ferrers diagram of a partition _p_.

```
>>> [5 3 2 1 1]
>>> .durfeeSquare
2

>>> [8 5 5 3 3 2 2 2]
>>> .durfeeSquare
3

>>> [4 3 3 2 1 1]
>>> .durfeeSquare
3

>>> [6 4 4 4 2 1]
>>> .durfeeSquare
4
```

The size of the Durfee square remains unchanged between a partition and its conjugate partition:

```
>>> [5 3 2 1 1]
>>> .conjugatePartition
>>> .durfeeSquare
2

>>> [8 8 5 3 3 1 1 1]
>>> .conjugatePartition
>>> .durfeeSquare
3

>>> [4 3 3 2 1 1]
>>> .conjugatePartition
>>> .durfeeSquare
3

>>> [6 4 4 4 2 1]
>>> .conjugatePartition
>>> .durfeeSquare
4
```

At the unit partition:

```
>>> [9].durfeeSquare
1
```

The sum of the Durfee squares of the partitions of n equals the sum of the positive cranks of the partitions of n:

```
>>> 1:16.collect { :n |
>>> 	n.integerPartitions.sum(
>>> 		durfeeSquare:/1
>>> 	)
>>> }
[1 2 3 6 9 16 23 36 52 76 106 152 207 286 386 522]

>>> 1:16.collect { :n |
>>> 	n.integerPartitions.collect(
>>> 		dysonCrank:/1
>>> 	).select(isPositive:/1).sum
>>> }
[0 2 3 6 9 16 23 36 52 76 106 152 207 286 386 522]
```

* * *

See also: dysonCrank, ferrersDiagram

Guides: Partition Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DurfeeSquare.html)
[2](https://resources.wolframcloud.com/FunctionRepository/resources/DurfeeSquare/),
_W_
[1](https://en.wikipedia.org/wiki/Durfee_square)
