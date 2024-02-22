# partitionFunctionP

- _partitionFunctionP(n)_
- _partitionFunctionP(n, k)_

The unary form answers the number of unrestricted partitions of the Integer _n_.

The binary form denotes the number of ways of writing _n_ as a sum of exactly _k_ terms
or, equivalently, the number of partitions into parts of which the largest is exactly _k_.

```
>>> 0:12.collect(partitionFunctionP:/1)
[1 1 2 3 5 7 11 15 22 30 42 56 77]
```

_partitionFunctionP_ gives the length of _integerPartitions_:

```
>>> 5.integerPartitions
[5; 4 1; 3 2; 3 1 1; 2 2 1; 2 1 1 1; 1 1 1 1 1]

>>> 5.partitionFunctionP
7
```

Initial triangle of _P(n, k)_:

```
>>> 1:6.collect { :n | 1:n.collect { :k | n.partitionFunctionP(k) } }
[1; 1 1; 1 1 1; 1 2 1 1; 1 2 2 1 1; 1 3 3 2 1 1]
```

Plot the number of unrestricted partitions:

~~~
0:50.collect(partitionFunctionP:/1).log10.plot
~~~

* * *

See also: integerPartitions, partitionFunctionQ

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PartitionFunctionP.html)
[2](https://reference.wolfram.com/language/ref/PartitionsP.html)
