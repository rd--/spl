# deepCopy

- _deepCopy(anObject)_

Answer a copy of _anObject_ with its own copy of each instance variable.

A `deepCopy` of a `List`:

```
>>> let l = [1; 2 3];
>>> let c = l.deepCopy;
>>> c[2][1] := -2;
>>> c ~= l & { c = [1; -2 3] & { l = [1; 2 3] } }
true
```

Compare to `copy`:

```
>>> let l = [1; 2 3];
>>> let c = l.copy;
>>> c[2][1] := -2;
>>> c ~~ l & { c = l }
true
```

* * *

See also: copy, postCopy, shallowCopy

Categories: Copying
