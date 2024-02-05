# atAllPut

- _atAllPut(aCollection, anObject)_

Put _anObject_ at every entry of _aCollection_.
Answer _anObject_.

```
>>> let l = List(9);
>>> let z = l.atAllPut(0);
>>> (l, z)
([0 0 0 0 0 0 0 0 0], 0)
```

- _atAllPut(aSequence, indices, anObject)_

Put _anObject_ at every index specified by the elements of _indices_ in _aSequence_.

```
>>> let l = [1 .. 9];
>>> let z = l.atAllPut([3 .. 7], 0);
>>> (l, z)
([1 2 0 0 0 0 0 8 9], 0)
```

_Note:_
This method imlpements both _atAllPut:_ and _atAll:put:_.

* * *

See also: at, atAll, atPut

Categories: Accessing
