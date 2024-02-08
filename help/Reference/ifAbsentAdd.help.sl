# ifAbsentAdd

_ifAbsentAdd(aSet, anObject)_

Ensure anObject is part of _aSet_.
Answer whether it’s membership was newly acquired.

```
>>> let s = Set();
>>> let i = s.ifAbsentAdd(1);
>>> let j = s.ifAbsentAdd(1);
>>> (s.asList, i, j)
([1], true, false)
```

* * *

See also: add, include, Set
