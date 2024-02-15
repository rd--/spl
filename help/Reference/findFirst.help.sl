# findFirst

- _findFirst(aSequence, aBlock:/1)_

Answer the index of the first element in _aSequence_ that answers true to the predicate _aBlock_.

```
>>> [5 4 3 2 1].findFirst { :each | each % 3 = 0 } = 3
true
```

If no such element is found answer zero.

```
>>> [5 4 3 2 1].findFirst { :each | each % 7 = 0 } = 0
true
```

* * *

See also: detect, findLast, select

Categories: Accessing
