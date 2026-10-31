# copyList

- _copyList(c)_

Answer a `List` that is a copy of the collection _c_.
If _c_ is already a list it is still copied.
This is unlike `List`,
and it avoids making the extra copy that `copy` of `List` makes if _c_ is not a list.

```
>>> let a = [1 2 3];
>>> let b = a.copyList;
>>> let c = List(a);
>>> (a == b, a == c)
(false, true)
```

_Note_:
Would it be better if `List` at `List` was copying,
and so on for all types?

* * *

See also: List, copy

Guides: Copying Functions, List Functions
