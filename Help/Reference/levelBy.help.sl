# levelBy

- _levelBy(aCollection, aBlock:/1)_

Answer a `List` of all sub-trees of _aCollection_ at levels specified by the predicate _aBlock_.

Values in a `Dictionary` are at the first level:

```
>>> (x: 1, y: 2).levelBy { :k | k = 1 }
[1 2]
```

Fetch elements from nested Records:

```
>>> (x: 1, y: (x: 2, y: 3)).levelBy { :k | k = 2 }
[2 3]

>>> (x: 1, y: (x: 2, y: 3)).levelBy { :k | k = 1 }
[1, (x: 2, y: 3)]
```

At `List`:

```
>>> [2 3 2].iota.levelBy { :k | k = 1 }
[1 2; 3 4; 5 6:; 7 8; 9 10; 11 12]

>>> [2 3 2].iota.levelBy { :k | k = 2 }
[1 2; 3 4; 5 6; 7 8; 9 10; 11 12]

>>> [2 3 2].iota.levelBy { :k | k = 3 }
[1 2 3 4 5 6 7 8 9 10 11 12]
```

`depth` answers the smallest value for which `levelBy` returns an empty list:

```
>>> let l = [2 3 2].iota;
>>> let n = l.depth;
>>> l.levelBy { :k | k = n }
[]
```

Level `zero` is the collection, which is then enclosed:

```
>>> 1:9.levelBy { :k | k = 0 }
[1:9]
```

* * *

See also: level, levelEach, withLevelCollect
