# findLast

- _findLast(aSequence, aBlock:/1)_

Answer the index of the last element in _aSequence_ that answers true to the predicate _aBlock_.

```
>>> [5 4 3 2 1 2 3 4 5].findLast { :each | each % 3 = 0 }
7
```

If no such element is found answer zero.

```
>>> [5 4 3 2 1].findLast { :each | each % 7 = 0 }
0
```

* * *

See also: detect, findFirst, select

References:
_Smalltalk_
5.7.8.16

Categories: Accessing
