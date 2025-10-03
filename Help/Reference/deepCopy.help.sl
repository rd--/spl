# deepCopy

- _deepCopy(x)_

Answer a copy of the object _x_ with its own copy of each instance variable.
Deep copying is implemented for `List`, `Record`, `Map` and `IdentitySet`.

A deep copy of a `List`:

```
>>> let a = [1; 2 3];
>>> let b = a.deepCopy;
>>> a[2][1] := -2;
>>> (a != b, a, b)
(true, [1; -2 3], [1; 2 3])
```

Compare to `copy`:

```
>>> let a = [1; 2 3];
>>> let b = a.copy;
>>> a[2][1] := -2;
>>> (a != b, a, b)
(false, [1; -2 3], [1; -2 3])
```

A deep copy of a `Record`:

```
>>> let a = (x: 1, y: (z: 2));
>>> let b = a.deepCopy;
>>> a['y']['z'] := -2;
>>> (a != b, a, b)
(true, (x: 1, y: (z: -2)), (x: 1, y: (z: 2)))
```

* * *

See also: copy, postCopy, shallowCopy

Guides: Copying Functions

Categories: Copying
