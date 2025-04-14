# skipTo

- _skipTo(aStream, anObject)_

Sets _aStream_ to read the object just after the next occurrence of _anObject_ and answer `true`.
If _anObject_ is not found before the end of the stream is encountered, answers `false`.

Skip to an object:

```
>>> let s = [1 3 5 7 9 11].asStream;
>>> s.skipTo(7);
>>> (s.position, s.upToEnd)
(4, [9 11])
```

* * *

See also: position, skip, upToEnd

References:
_Smalltalk_
5.9.2.10

Categories: Accessing, Stream
