# withLevelCollect

- _withLevelCollect(aCollection, aBlock:/2)_

A descending traversal over _aCollection_,
where _aBlock_ is applied to each sub-tree with the corresponding level as the second argument.

Annotate each node of a tree with the level value:

```
>>> [1, [2, [3]]].withLevelCollect { :z :k | (k, z) }
(0, [(1, 1), (1, [(2, 2), (2, [(3, 3)])])])
```

Reverse at each level of a rank three array:

```
>>> [2 3 2].iota
[1 2; 3 4; 5 6:; 7 8; 9 10; 11 12]

>>> [2 3 2].iota.withLevelCollect { :z :k | (k = 0).if { z.reversed } { z } }
[7 8; 9 10; 11 12:; 1 2; 3 4; 5 6]

>>> [2 3 2].iota.withLevelCollect { :z :k | (k = 1).if { z.reversed } { z } }
[5 6; 3 4; 1 2:; 11 12; 9 10; 7 8]

>>> [2 3 2].iota.withLevelCollect { :z :k | (k = 2).if { z.reversed } { z } }
[2 1; 4 3; 6 5:; 8 7; 10 9; 12 11]

>>> [2 3 2].iota.withLevelCollect { :z :k | (k = 3).if { z.negated } { z } }
[-1 -2; -3 -4; -5 -6:; -7 -8; -9 -10; -11 -12]
```

Reverse at each two and three element combination of levels of a rank three array:

```
>>> [2 3 2].iota.withLevelCollect { :z :k |
>>> 	[0 1].includes(k).if { z.reversed } { z }
>>> }
[
	11 12;  9 10;  7  8:;
	 5  6;  3  4;  1  2
]

>>> [2 3 2].iota.withLevelCollect { :z :k |
>>> 	[0 2].includes(k).if { z.reversed } { z }
>>> }
[
	 8  7; 10  9; 12 11:;
	 2  1;  4  3;  6  5
]

>>> [2 3 2].iota.withLevelCollect { :z :k |
>>> 	[1 2].includes(k).if { z.reversed } { z }
>>> }
[
	 6  5;  4  3;  2  1:;
	12 11; 10  9;  8  7
]

>>> [2 3 2].iota.withLevelCollect { :z :k |
>>> 	[0 1 2].includes(k).if { z.reversed } { z }
>>> }
[
	12 11; 10  9;  8  7:;
	 6  5;  4  3;  2  1
]
```

* * *

See also: atLevelCollect, collect, deepCollect, depth

References:
_Apl_
[1](https://aplwiki.com/wiki/Depth_(operator)),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/lcapco),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Map.html)
