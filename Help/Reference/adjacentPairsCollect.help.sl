# adjacentPairsCollect

- _adjacentPairsCollect(aSequence, aBlock:/2)_

Collect over the items of _aSequence_ taken two at a time,
moving forward one place each time.

At `Range`:

```
>>> 1:7.adjacentPairsCollect(+)
[1 + 2, 2 + 3, 3 + 4, 4 + 5, 5 + 6, 6 + 7]
```

At `List`:

```
>>> [10 6 3 1 0].adjacentPairsCollect(-)
[4 3 2 1]
```

At `Tuple`:

```
>>> (7, 23, 47).adjacentPairsCollect(*)
(161, 1081)
```

Answer a matrix:

```
>>> 1:7.adjacentPairsCollect { :i :j |
>>> 	[i, j]
>>> }
[1 2; 2 3; 3 4; 4 5; 5 6; 6 7]
```

This is equivalent to `partition` with window size of two and step size of one:

```
>>> 1:7.partition(2, 1)
[1 2; 2 3; 3 4; 4 5; 5 6; 6 7]
```

* * *

See also: adjacentPairs, adjacentPairsDo, collect, pairsCollect, partition, partitionDo

Categories: Enumerating
