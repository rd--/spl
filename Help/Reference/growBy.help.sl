# growBy

- _growBy(c, n)_

Answer a collection like _c_ that is grown,
or contracted if _n_ is negative,
by _n_ places.

Grow a list:

```
>>> let a = [1 .. 5];
>>> let b = a.growBy(3);
>>> (b, a !== b)
([1 2 3 4 5 nil nil nil], true)
```

Shrink a list:

```
>>> let a = [1 .. 5];
>>> let b = a.growBy(-3);
>>> (b, a !== b)
([1 2], true)
```

* * *

See also: copyFromTo, new, replaceFromToWithStartingAt

Guides: List Functions
