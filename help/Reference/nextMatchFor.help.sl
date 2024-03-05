# nextMatchFor

- _nextMatchFor(aStream, anObject)_

Reads the next object from the stream and answer `true` if the object is equivalent to _anObject_, and `false` if not.

```
>>> let stream = 1:9.asIterator;
>>> (stream.nextMatchFor(1), stream.next)
(true, 2)
```

* * *

See also: next, peekFor, Stream

References:
_Smalltalk_
5.9.2.6

Categories: Accessing
