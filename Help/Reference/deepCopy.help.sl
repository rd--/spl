# deepCopy

- _deepCopy(x)_

Answer a copy of the object _x_ with its own copy of each instance variable.

A `deepCopy` of a `List`:

```
>>> let l = [1; 2 3];
>>> let c = l.deepCopy;
>>> c[2][1] := -2;
>>> (c != l, c, l)
(true, [1; -2 3], [1; 2 3])
```

Compare to `copy`:

```
>>> let l = [1; 2 3];
>>> let c = l.copy;
>>> c[2][1] := -2;
>>> (c != l, c, l)
(false, [1; -2 3], [1; -2 3])
```

* * *

See also: copy, postCopy, shallowCopy

Guides: Copying Functions

Categories: Copying
