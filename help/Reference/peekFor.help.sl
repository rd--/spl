# peekFor

- _peekFor(aStream, anObject)_

Answer `false` and do not move over the next element if it is not equal to _anObject_,
or if the receiver is at the end.
Answer `true` and increment the position for accessing elements, if the next element is equal to `anObject`.


```
>>> let stream = 1:5.asStream;
>>> (stream.peekFor(1), stream.next)
(true, 2)
```

* * *

See also: peek, Stream

References:
_Smalltalk_
5.9.2.8

Categories: Accessing
