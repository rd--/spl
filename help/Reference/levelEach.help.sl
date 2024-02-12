# levelEach

_levelEach(aCollection, anotherCollection)_

Answer a List of all sub-trees of _aCollection_ at levels in _anotherCollection_.

Answer is depth first:

```
>>> [2 3 2].iota.levelEach([1, 3])
([1 .. 6] ++ [[1 2; 3 4; 5 6]] ++ [7 .. 12] ++ [[7 8; 9 10; 11 12]])
```

* * *

See also: level, levelBy, withLevelCollect
