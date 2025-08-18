# include

- _include(c, x)_

Include the object _x_ as one of the elements of the collection _c_.
After including an entry, the `size` of the collection may increases by one, or may stay the same.
Answers _x_.

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

At `IdentitySet`:

```
>>> let r = IdentitySet();
>>> r.include('x');
>>> (r.include('x'), r.size)
('x', 1)
```

At `Set`:

```
>>> let s = Set(~);
>>> s.include(1);
>>> (s.include(1.00001), s.asList, s.size)
(1.00001, [1], 1)
```

Attempting to `include` a non-immediate object in an `IdentitySet` is an `error`:

```
>>> let s = IdentitySet();
>>> { s.include([1]) }.ifError { true }
true
```

See instead `basicInclude`:

```
>>> let s = IdentitySet();
>>> s.basicInclude([1]);
>>> s.basicInclude([1]);
>>> s.size = 2
true
```

* * *

See also: add, basicInclude, includeAll, isImmediate, remove

Categories: Adding
