# level

- _level(c, [l₁ l₂ …])_

Answer a `List` of all sub-trees of the collection _c_ at levels in  the list _l_.
Answer is depth first.

Values in a `Dictionary` are at the first level:

```
>>> (x: 1, y: 2).level([1])
[1 2]
```

Fetch elements from nested `Record`s:

```
>>> (x: 1, y: (x: 2, y: 3)).level([2])
[2 3]

>>> (x: 1, y: (x: 2, y: 3)).level([1])
[1, (x: 2, y: 3)]
```

Fetch multiple levels from a `Record`:

```
>>> (x: (a: 1, c: 2)).level([1 2])
[1, 2, (a: 1, c: 2)]
```

At `List`:

```
>>> [2 3 2].iota
[1 2; 3 4; 5 6:; 7 8; 9 10; 11 12]

>>> [2 3 2].iota.level([1])
[2 3 2].iota

>>> [2 3 2].iota.level([2])
[1 2; 3 4; 5 6; 7 8; 9 10; 11 12]

>>> [2 3 2].iota.level([3])
[1 2 3 4 5 6 7 8 9 10 11 12]
```

Answer multiple levels, depth first:

```
>>> let l = [[[[0]]]];
>>> 1:5.collect { :n |
>>> 	l.level(1:n)
>>> }
[
	[[[[0]]]],
	[[[0]], [[[0]]]],
	[[0], [[0]], [[[0]]]],
	[0, [0], [[0]], [[[0]]]],
	[0, [0], [[0]], [[[0]]]]
]
```

Answer non-contiguous levels:

```
>>> [2 3 2].iota.level([1 3])
[
	[1 .. 6],
	[[1 2; 3 4; 5 6]],
	[7 .. 12],
	[[7 8; 9 10; 11 12]]
].++
```

At `Tree`:

```
>>> [1, [2, [3], 4], 5]
>>> .expressionTree(nil)
>>> .level([2])
[
	Tree(2, []),
	Tree(nil, [Tree(3, [])]),
	Tree(4, [])
]
```

At empty `Tree`:

```
>>> Tree(nil, []).level([0])
[Tree(nil, [])]
```

`depth` answers the smallest value for which `level` returns an empty list:

```
>>> let l = [2 3 2].iota;
>>> l.level([l.depth])
[]
```

Level zero is the collection, which is then enclosed:

```
>>> 1:9.level([0])
[1:9]
```

* * *

See also: depth, levelBy, withLevelCollect, withLevelDo

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Level.html)
