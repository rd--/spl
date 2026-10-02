# shallowCopy

- _shallowCopy(x)_

Answer a copy of the object _x_ which shares instance variables.

The  shallow copy of a list of lists does not copy the sub-lists.
Changes a sub-list of the copy are visible in the initial list:

```
>>> let x = [1 2; 3 4; 5 6];
>>> let y = x.shallowCopy;
>>> y[2][1] := -3;
>>> (x, x = y, x == y)
([1 2; -3 4; 5 6], true, false)
```

* * *

See also: Copy, copy, deepCopy, postCopy

Guides: Copying Functions

Categories: Copying
