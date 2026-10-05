# copyList

- _copyList(c)_

Answer a `List` that is a copy of the collection _c_.
If _c_ is alread a list it is still copied.
This is unlike `List`,
and it avoids making the extra copy that `copy` of `List` makes if _c_ is not a list.

```
>>> let a = [1 2 3].copyList;
>>> let b = a.copyList;
>>> let c = a.List;
>>> (a == b, a == c)
(false, true)
```

* * *

See also: copy, List

Guides: Copying Functions, List Functions
