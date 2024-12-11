# nextSatisfy

- _nextSatisfy(aStream, aBlock:/1)_

Answer the next element of _aStream_ that satisfies the predicate _aBlock_.

```
>>> 1:9.asIterator.nextSatisfy { :each |
>>> 	each >= 5
>>> } = 5
true
```

* * *

See also: Iterator, next, Stream
