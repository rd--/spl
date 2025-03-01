# atAllPut

- _atAllPut(aCollection, anObject)_
- _atAllPut(aSequence, indices, anObject)_

In the binary case,
put _anObject_ at every entry of _aCollection_.
Answer _anObject_.

```
>>> let l = List(9);
>>> let z = l.atAllPut(0);
>>> (l, z)
([0 0 0 0 0 0 0 0 0], 0)
```

In the ternary case,
put _anObject_ at every index specified by the elements of _indices_ in _aSequence_.

```
>>> let l = [1 .. 9];
>>> let z = l.atAllPut([3 .. 7], 0);
>>> (l, z)
([1 2 0 0 0 0 0 8 9], 0)
```

_Note:_
This method imlpements both _atAllPut:_ and _atAll:put:_.

* * *

See also: at, atAll, atAllPutAll, atPut

References:
_Smalltalk_
5.7.12.2
5.7.12.3

Categories: Accessing
