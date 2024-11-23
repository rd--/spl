# upTo

- _upTo(aStream, anObject)_

Answer a collection of all of the items in _aStream_ up to, but not including, the next occurrence of _anObject_.
Sets the stream to read the object just after the next occurrence of _anObject_.

```
>>> let stream = 1:9.asStream;
>>> (stream.upTo(5), stream.upToEnd)
(1:4, 6:9)
```

If _anObject_ is not found and the end of the stream is encountered, the objects read are answered.

```
>>> 1:9.asStream.upTo(11)
1:9
```

At `BlockStream`:

```
>>> let stream = 1:11.asStream.reject(isEven:/1);
>>> (stream.upTo(7), stream.upToEnd)
([1 3 5], [9 11])
```

* * *

See also: Iterator, next, Stream, upToEnd

References:
_Smalltalk_
5.9.2.11

Categories: Accessing
