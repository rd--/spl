# ifAbsentAdd

_ifAbsentAdd(aCollection, anObject)_

Ensure anObject is part of _aCollection_.
Answer whether it’s membership was newly acquired.

At `Set`:

```
>>> let s = Set();
>>> let i = s.ifAbsentAdd(1);
>>> let j = s.ifAbsentAdd(1);
>>> (s.asList, i, j)
([1], true, false)
```

At `List`:

```
>>> let l = [];
>>> let i = l.ifAbsentAdd(1);
>>> let j = l.ifAbsentAdd(1);
>>> (l, i, j)
([1], true, false)
```

* * *

See also: add, include, Set

Categories: Collection
