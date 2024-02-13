# partitionFunctionQ

_partitionFunctionQ(n, k)_

Denotes the number of ways of partitioning _n_ into exactly _k_ distinct parts.

For example, _Q(10,3)=4_ since there are four partitions of 10 into three distinct parts: {1,2,7}, {1,3,6}, {1,4,5}, and {2,3,5}.

```
>>> 10.partitionFunctionQ(3)
4

>>> 10.integerPartitions(3).collect(nub:/1).select { :each | each.size = 3 }
[7 2 1; 6 3 1; 5 4 1; 5 3 2]
```

The following table gives the first few values of _Q(n,k)_:

```
1:10.collect { :n | 1:4.collect { :k | n.partitionFunctionQ(k) }.select { :i | i > 0 } }
[1; 1; 1 1 ; 1 1; 1 2; 1 2 1; 1 3 1; 1 3 2; 1 4 3; 1 4 4 1]
```

* * *

See also: integerPartitions, partitionFunctionP

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PartitionFunctionQ.html)
[2](https://reference.wolfram.com/language/ref/PartitionsQ.html)
