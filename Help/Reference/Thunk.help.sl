# Thunk

- _thunk(f:/0)_

`Thunk` is a `Type` that memoizes the answer of _f_ when first requested.

```
>>> let x = 1;
>>> let f = { x := x + 1; x };
>>> (f(), f(), f())
(2, 3, 4)

>>> let x = 1;
>>> let f = { x := x + 1; x }.thunk;
>>> (f.force, f.force, f.force)
(2, 2, 2)
```

The `memoize` method has the same function but answers a `Block` value:

```
>>> let x = 1;
>>> let f:/0 = { x := x + 1; x }.memoize;
>>> (f(), f(), f())
(2, 2, 2)
```

* * *

See also: memoize

Guides: Block Functions
