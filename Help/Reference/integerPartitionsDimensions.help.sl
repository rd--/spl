# integerPartitionsDimensions

- _integerPartitionsDimensions(n)_

Implement a direct form to calcuate the dimensions of the integer partitions of _n_.

```
>>> 6.integerPartitionsDimensions
[1 5 9 5 10 16 5 10 9 5 1]
```

Sorted,
OEIS [A003870](https://oeis.org/A003870):

```
>>> 6.integerPartitionsDimensions.sort
[1 1 5 5 5 5 9 9 10 10 16]
```

Table of dimensions of integer partitions,
OEIS [A117506](https://oeis.org/A117506):

```
>>> 1:6.collect(
>>> 	integerPartitionsDimensions:/1
>>> )
[
	1;
	1 1;
	1 2 1;
	1 3 2 3 1;
	1 4 5 6 5 4 1;
	1 5 9 5 10 16 5 10 9 5 1
]
```

Plot table:

~~~spl svg=A
1:8.collect(
	integerPartitionsDimensions:/1
).catenate.stepPlot
~~~

![](sw/spl/Help/Image/integerPartitionsDimensions-A.svg)

Plot table of dimensions of integer partitions in ascending order,
OEIS [A060240](https://oeis.org/A060240):

~~~spl svg=B
1:11.collect { :n |
	n.integerPartitionsDimensions
	.sort
}.catenate.log.stepPlot
~~~

![](sw/spl/Help/Image/integerPartitionsDimensions-B.svg)

* * *

See also: hookLengthFormula, integerPartitions

References:
_OEIS_
[1](https://oeis.org/A117506)
