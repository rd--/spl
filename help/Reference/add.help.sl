# add

- _add(aCollection, newObject)_

Include _newObject_ as one of the elements of _aCollection_.
After adding an entry, the `size` of the collection increases by one.
Therefore, for collections with invariants such as `Dictionary` and `Set`, add may fail.
In these cases see `include`, which is like `add` except that the size of the collection may stay the same.
Answers _newObject_.

At `Bag`:

```
>>> let b = Bag();
>>> b.add('x');
>>> (b.add('y'), b.size, b.asList)
('y', 2, ['x' 'y'])
```

At `List`:

```
>>> let l = List();
>>> l.add('x');
>>> (l.add('y'), l.size, l)
('y', 2, ['x' 'y'])
```

At `Map`:

```
>>> let m = Map();
>>> m.add('x' -> 1);
>>> (m.add('y' -> 2), m.size, m.asRecord)
('y' -> 2, 2, (x: 1, y: 2))
```

At `Record`:

```
>>> let r = Record();
>>> r.add('x' -> 1);
>>> (r.add('y' -> 2), r.size, r)
('y' -> 2, 2, (x: 1, y: 2))
```

At `Set`, add will include _newObject_ as one of the set elements only if not already present:

```
>>> let s = Set();
>>> s.add('x');
>>> (s.add('y'), s.size, s.asList)
('y', 2, ['x' 'y'])

>>> { [1].asSet.add(1) }.ifError { true}
true
```

At `String`, which is not `Extensible`:

```
>>> let s = 'string';
>>> { s.add('!') }.ifError { :err | true }
true
```

* * *

See also: addAll, Extensible, include, remove

References:
_Smalltalk_
5.7.5.1

Categories: Adding
