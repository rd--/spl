# include

- _include(aCollection, newObject)_

Include _newObject_ as one of the elements of _aCollection_.
After including an entry, the _size_ of the collection may increases by one, or may stay the same.
Answers _newObject_.

```
>>> let r = Map();
>>> r.include('x' -> 1);
>>> r.include('x' -> 2) = ('x' -> 2) & { r.size = 1 }
true

>>> let r = Record();
>>> r.include('x' -> 1);
>>> r.include('x' -> 2) = ('x' -> 2) & { r.size = 1 }
true

>>> let r = Set();
>>> r.include('x');
>>> r.include('x') = 'x' & { r.size = 1 }
true
```

Attempting to _include_ a non-immediate object in a Set is an error,
see instead _basicInclude_.

```
>>> let s = Set();
>>> { s.include([1]) }.ifError { true }
true

>>> let s = Set();
>>> s.basicInclude([1]);
>>> s.basicInclude([1]);
>>> s.size = 2
true
```

* * *

See also: add, basicInclude, includeAll, remove

Categories: Adding
