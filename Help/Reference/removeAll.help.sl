# removeAll

- _removeAll(aCollection)_
- _removeAll(aCollection, anotherCollection)_

In the unary case remove all items from _aCollection_.
The answer is an empty collection.

```
>>> let l = [1 2 3];
>>> (l.removeAll, l)
([1 2 3], [])

>>> let r = (x: 1, y: 2, z: 3);
>>> (r.removeAll, r)
(['x' 'y' 'z'], ())
```

In the binary case remove all items in _anotherCollection_ from _aCollection_.
Multiples of items in _aCollection_ will not necessarily be removed.

```
>>> let l = [1 2 3];
>>> (l.removeAll([1 2]), l)
([1 2], [3])

>>> let r = (x: 1, y: 2, z: 3);
>>> (r.removeAll(['x' -> 1, 'y' -> 2]), r)
(['x' -> 1, 'y' -> 2], (z: 3))
```

At `Storage` will remove all entries:

~~~spl effect=cache
system.localStorage.removeAll
~~~

* * *

See also: remove, removeAllEqualTo, removeAllFoundIn, removeAllSuchThat, removeAt, removeAtAll

References:
_Smalltalk_
5.7.5.5

Categories: Removing
