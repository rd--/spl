# blockMap

- _blockMap(aBlock:/1, aList, n, d)_

Applies _aBlock_ to sublists of size _n_ in _aList_ with offset _d_.

Apply a function to all non-overlapping, length two sublists:

```
>>> identity:/1.blockMap([1 .. 9], 2, 2)
[1 2; 3 4; 5 6; 7 8]
```

Apply a function to overlapping sublists of length two with step one:

```
>>> identity:/1.blockMap([1 .. 9], 2, 1)
[1 2; 2 3; 3 4; 4 5; 5 6; 6 7; 7 8; 8 9]
```

* * *

See also: adjacentPairsCollect, arrayFilter, map, movingMap, partition

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BlockMap.html)
