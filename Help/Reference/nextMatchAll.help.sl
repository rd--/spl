# nextMatchAll

- _nextMatchAll(aStream, aSequence)_

Reads the next _aSequence.size_ objects from the stream and answer `true` if the objects are equivalent to _aSequence_,
and `false` if not.

```
>>> let s = [1 3 5 7 9].asIterator;
>>> (s.nextMatchAll([1 3 5]), s.next)
(true, 7)
```

* * *

See also: next, nextMatchFor, peekFor, Stream

Categories: Accessing
