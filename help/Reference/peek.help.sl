# peek

- _peek(aStream)_

Answer what would be returned if the message _next_ were sent to the _aStream_.
If the stream is at the end, answer nil.

```
>>> let stream = 1:5.asStream;
>>> (stream.peek, stream.next)
(1, 1)
```

* * *

See also: next, peekFor, Stream

References:
_Smalltalk_
5.9.2.7

Categories: Accessing
