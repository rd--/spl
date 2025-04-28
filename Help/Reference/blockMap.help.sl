# blockMap

- _blockMap(aBlock:/1, aList, n, d)_

Applies _aBlock_ to sublists of size _n_ in _aList_ with offset _d_.

Apply a function to all non-overlapping, length two sublists:

```
>>> identity:/1
>>> .blockMap([1 .. 9], 2, 2)
[
	1 2;
	3 4;
	5 6;
	7 8
]
```

Apply a function to overlapping sublists of length two with step one:

```
>>> identity:/1
>>> .blockMap([1 .. 9], 2, 1)
[
	1 2;
	2 3;
	3 4;
	4 5;
	5 6;
	6 7;
	7 8;
	8 9
]
```

Skip elements by using an offset larger than the block size:

```
>>> identity:/1
>>> .blockMap([1 .. 8], 2, 3)
[
	1 2;
	4 5;
	7 8
]
```

Incomplete sublists at the end are dropped:

```
>>> identity:/1
>>> .blockMap([1 .. 11], 4, 4)
[
	1 2 3 4;
	5 6 7 8
]
```

Compute successive differences of elements:

```
>>> { :x |
>>> 	x[2] - x[1]
>>> }.blockMap([1 .. 6], 2, 1)
[
	2 - 1,
	3 - 2,
	4 - 3,
	5 - 4,
	6 - 5
]
```

Compute a moving average with runs of three elements:

```
>>> mean:/1.blockMap([1 .. 5], 3, 1)
[
	(1 + 2 + 3) / 3,
	(2 + 3 + 4) / 3,
	(3 + 4 + 5) / 3
]
```

* * *

See also: adjacentPairsCollect, arrayFilter, map, movingMap, partition

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BlockMap.html)
