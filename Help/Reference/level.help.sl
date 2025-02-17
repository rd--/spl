# level

- _level(aCollection, anInteger)_

Answer a `List` of all sub-trees of _aCollection_ at level _anInteger_.

Values in a `Dictionary` are at the first level:

```
>>> (x: 1, y: 2).level(1)
[1 2]
```

Fetch elements from nested `Record`s:

```
>>> (x: 1, y: (x: 2, y: 3)).level(2)
[2 3]

>>> (x: 1, y: (x: 2, y: 3)).level(1)
[1, (x: 2, y: 3)]
```

At `List`:

```
>>> [2 3 2].iota.level(1)
[1 2; 3 4; 5 6 :; 7 8; 9 10; 11 12]

>>> [2 3 2].iota.level(2)
[1 2; 3 4; 5 6; 7 8; 9 10; 11 12]

>>> [2 3 2].iota.level(3)
[1 2 3 4 5 6 7 8 9 10 11 12]
```

At `Tree`:

```
>>> [1, [2, [3], 4], 5]
>>> .expressionTree(nil)
>>> .level(2)
[Tree(2, []), Tree(nil, [Tree(3, [])]), Tree(4, [])]
```

`depth` answers the smallest value for which `level` returns an empty list:

```
>>> let l = [2 3 2].iota;
>>> l.level(l.depth)
[]
```

Level zero is the collection, which is then enclosed:

```
>>> 1:9.level(0)
[1:9]
```

* * *

See also: depth, levelBy, levelEach, withLevelCollect

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Level.html)
