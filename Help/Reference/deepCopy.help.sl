# deepCopy

- _deepCopy(x)_

Answer a copy of the object _x_ with its own copy of each instance variable.
Deep copying is implemented for `List`, `Record`, `Map` and `IdentitySet`.

A deep copy of a `List`:

```
>>> let x = [1 2; 3 4; 5 6];
>>> let y = x.deepCopy;
>>> y[2][1] := -3;
>>> (x[2], y[2], x != y)
([3 4], [-3 4], true)
```

Compare to `copy`:

```
>>> let x = [1 2; 3 4; 5 6];
>>> let y = x.copy;
>>> y[2][1] := -3;
>>> (x, x = y, x == y)
([1 2; -3 4; 5 6], true, false)
```

A deep copy of a `Record`:

```
>>> let a = (x: 1, y: (z: 2));
>>> let b = a.deepCopy;
>>> b['y']['z'] := -2;
>>> (a['y'], b['y'], a != b)
((z: 2), (z: -2), true)
```

* * *

See also: Copy, copy, postCopy, shallowCopy

Guides: Copying Functions

Categories: Copying
