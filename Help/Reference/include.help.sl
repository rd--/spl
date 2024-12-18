# include

- _include(aCollection, newObject)_

Include _newObject_ as one of the elements of _aCollection_.
After including an entry, the _size_ of the collection may increases by one, or may stay the same.
Answers _newObject_.

```
>>> let r = Map();
>>> r.include('x' -> 1);
>>> (r.include('x' -> 2), r.size)
('x' -> 2, 1)
```

At `Record`:

```
>>> let r = Record();
>>> r.include('x' -> 1);
>>> (r.include('x' -> 2), r.size)
('x' -> 2, 1)
```

At `Set`:

```
>>> let r = Set();
>>> r.include('x');
>>> (r.include('x'), r.size)
('x', 1)
```

Attempting to `include` a non-immediate object in a Set is an `error`:

```
>>> let s = Set();
>>> { s.include([1]) }.ifError { true }
true
```

See instead `basicInclude`:

```
>>> let s = Set();
>>> s.basicInclude([1]);
>>> s.basicInclude([1]);
>>> s.size = 2
true
```

* * *

See also: add, basicInclude, includeAll, isImmediate, remove

Categories: Adding
