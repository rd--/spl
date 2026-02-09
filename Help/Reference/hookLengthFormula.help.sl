# hookLengthFormula

- _hookLengthFormula(p)_

Implement the hook length formula,
telling the number of standard Young tableaux whose shape is a given Young diagram.

```
>>> [4 3 1 1].hookLengthFormula
216

>>> [4 3 1 1].hookLengths
[
	7 4 3 1;
	5 2 1;
	2;
	1
]

>>> [7 4 3 1 5 2 1 2 1].product
1680

>>> [4 3 1 1].sum
9

>>> 9.! / 1680
216
```

The dimenions of the eleven integer partitions of six and seven:

```
>>> 6.integerPartitions
>>> .collect(hookLengthFormula:/1)
[1 5 9 10 5 16 10 5 9 5 1]

>>> 7.integerPartitions
>>> .collect(hookLengthFormula:/1)
[1 6 14 15 14 35 20 21 21 35 15 14 14 6 1]
```

Table of dimensions of integer partitions,
OEIS [A117506](https://oeis.org/A117506):

```
>>> 1:6.collect { :n |
>>> 	n.integerPartitions
>>> 	.collect(hookLengthFormula:/1)
>>> }
[
	1;
	1 1;
	1 2 1;
	1 3 2 3 1;
	1 4 5 6 5 4 1;
	1 5 9 10 5 16 10 5 9 5 1
]
```

Plot table:

~~~spl svg=A
1:8.collect { :n |
	n.integerPartitions
	.collect(hookLengthFormula:/1)
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/hookLengthFormula-A.svg)

Table of dimensions of integer partitions in ascending order,
OEIS [A060240](https://oeis.org/A060240):

```
>>> 1:6.collect { :n |
>>> 	n.integerPartitions
>>> 	.collect(hookLengthFormula:/1)
>>> 	.sort
>>> }
[
	1;
	1 1;
	1 1 2;
	1 1 2 3 3;
	1 1 4 4 5 5 6;
	1 1 5 5 5 5 9 9 10 10 16
]
```

Plot table:

~~~spl svg=B
1:8.collect { :n |
	n.integerPartitions
	.collect(hookLengthFormula:/1)
	.sort
}.catenate.stepPlot
~~~

![](sw/spl/Help/Image/hookLengthFormula-B.svg)


* * *

See also: conjugatePartition, hookLengths

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HookLengthFormula.html),
_Python_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/partition.html#sage.combinat.partition.Partition.dimension),
_W_
[1](https://en.wikipedia.org/wiki/Hook_length_formula)
