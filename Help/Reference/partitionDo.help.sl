# partitionDo

- _partitionDo(aSequence, windowSize, stepSize, aBlock:/1)_

Apply _aBlock_ to each partition in turn.
Only one `List`, of _windowSize_ places, is allocated.

```
>>> let sum = 0;
>>> (1L .. 99999L).partitionDo(3, 5) { :each |
>>> 	sum := sum + each.product
>>> };
>>> sum
4999899993500070000L
```

* * *

See also: adjacentPairs, partition, partitionCollect
