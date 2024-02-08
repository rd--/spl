# add

- _add(aCollection, newObject)_

Include _newObject_ as one of the elements of _aCollection_.
After adding an entry, the _size_ of the collection increases by one.
Therefore, for collections with invariants such as _Dictionary_ and _Set_, add may fail.
In these cases see _include_, which is like _add_ except that the size of the collection may stay the same.
Answers _newObject_.

At Bag:

```
>>> let b = Bag();
>>> b.add('x');
>>> b.add('y') = 'y' & { b.size = 2 }
true
```

At List:

```
>>> let l = List();
>>> l.add('x');
>>> l.add('y') = 'y' & { l.size = 2 }
true
```

At Map:

```
>>> let m = Map();
>>> m.add('x' -> 1);
>>> m.add('y' -> 2) = ('y' -> 2) & { m.size = 2 }
true
```

At Record:

```
>>> let r = Record();
>>> r.add('x' -> 1);
>>> r.add('y' -> 2) = ('y' -> 2) & { r.size = 2 }
true
```

At Set, add will include _newObject_ as one of the set elements only if not already present:

```
>>> let s = Set();
>>> s.add('x');
>>> s.add('y') = 'y' & { s.size = 2 }
true

>>> { [1].asSet.add(1) }.ifError { true}
true
```

At String, which is not Extensible:

```
>>> let s = 'string';
>>> { s.add('!') }.ifError { :err | true }
true
```

* * *

See also: addAll, Extensible, include, remove

Categories: Adding
