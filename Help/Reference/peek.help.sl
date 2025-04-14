# peek

- _peek(aCollection)_

Answer what would be returned if the next item were requested from _aCollection_,
for instance `next` at a `Stream`,
or `pop` at a `Stack` or `PriorityQueue`.
If there is no item, answer nil.

```
>>> let s = [1 2 3 4 5].asStream;
>>> (s.peek, s.next)
(1, 1)
```

* * *

See also: next, peekFor, Stream

References:
_Smalltalk_
5.9.2.7

Categories: Accessing
