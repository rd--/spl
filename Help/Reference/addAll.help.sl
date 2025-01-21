# addAll

- _addAll(aCollection, anotherCollection)_

Include all the elements of _anotherCollection_ into _aCollection_.
Answer _anotherCollection_.

In general, any object responding to _do_ can be used as the second argument.

At `Bag`:

```
>>> let c = [1 2 2 3 3 3];
>>> let b = Bag();
>>> (b.addAll(c), b.size)
(c, 6)
```

At `Set`:

```
>>> let c = [1 2 3];
>>> let s = Set();
>>> (s.addAll(c), c.size)
(c, 3)
```

At `List`:

```
>>> let c = 1:9;
>>> let l = [];
>>> (l.addAll(c), l.size)
(c, 9)
```

At `Record`:

```
>>> let c = (y: 2, z: 3);
>>> let r = (x: 1);
>>> (r.addAll(c), r)
(c, (x: 1, y: 2, z: 3))
```

Adding no items to a `List`:

```
>>> let l = [1 2 3];
>>> l.addAll([]);
>>> l
[1 2 3]
```

* * *

See also: add, Extensible, include, includeAll, Iterable, remove, removeAll

References:
_Smalltalk_
5.7.2.1
5.7.5.2

Categories: Adding
