# doAdjacentPairs

- _doAdjacentPairs(aSequence, aBlock:/2)_

Apply _aBlock_ to each adjacent pair of _aSequence_ in turn.

```
>>> let l = [];
>>> 1:7.doAdjacentPairs { :i :j | l.add([i, j]) };
>>> l
[1 2; 2 3; 3 4; 4 5; 5 6; 6 7]
```

* * *

See also: do
