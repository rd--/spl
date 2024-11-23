# nextMatchAll

- _nextMatchAll(aStream, aSequence)_

Reads the next _aSequence.size_ objects from the stream and answer `true` if the objects are equivalent to _aSequence_, and `false` if not.

```
>>> let stream = 1:9.asIterator;
>>> (stream.nextMatchAll([1 2 3]), stream.next)
(true, 4)
```

* * *

See also: next, nextMatchFor, peekFor, Stream

Categories: Accessing
