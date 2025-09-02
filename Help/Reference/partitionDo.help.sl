# partitionDo

- _partitionDo(c, w, n, f:/1)_

Apply the block _f_ to each partition,
having window size _w_ places,
and moving fowards _n_ steps per iteration,
of the sequence _c_.
Only one `List`, of _w_ places, is allocated.

```
>>> let sum = 0;
>>> (1L .. 99999L).partitionDo(3, 5) { :each |
>>> 	sum := sum + each.product
>>> };
>>> sum
4999899993500070000L
```

* * *

See also: adjacentPairsDo, partition, partitionCollect

Guides: Iteration Functions
