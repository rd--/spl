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

>>> [7 9 16 20 1 5].adjacentPairsCollect(-.swap)
[2 7 4 -19 4]

>>> [7 23 47].adjacentPairsCollect(*)
[161 1081]

>>> [0 0.5 1 1.5 2 2.5 3 3.5]
>>> .adjacentPairsCollect { :i :j |
>>> 	i + ((j - i) / 2)
>>> }
[0.25 0.75 1.25 1.75 2.25 2.75 3.25]
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

See also: adjacentPairs, adjacentPairsDo, blockMap, collect, pairsCollect, partition, partitionDo

Categories: Enumerating
