# addAll

- _addAll(aCollection, anotherCollection)_

Include all the elements of _anotherCollection_ into _aCollection_.
Answer _anotherCollection_.

In general, any object responding to _do_ can be used as the second argument.

At Bag:

```
>>> let c = [1 2 2 3 3 3];
>>> let b = Bag();
>>> b.addAll(c) = c & { b.size = 6 }
true
```

At Set:

```
>>> let c = [1 2 3];
>>> let s = Set();
>>> s.addAll(c) = c & { c.size = 3 }
true
```

At List:

```
>>> let c = 1:9;
>>> let l = [];
>>> l.addAll(c) = c & { l.size = 9 }
true
```

At Record:

```
>>> let c = (y: 2, z: 3);
>>> let r = (x: 1);
>>> r.addAll(c) = c & { r = (x: 1, y: 2, z: 3) }
true
```

* * *

See also: add, include, includeAll, Iterable, remove, removeAll

References:
_Smalltalk_
5.7.2.1
5.7.5.2

Categories: Adding
