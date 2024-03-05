# skipTo

- _skipTo(aStream, anObject)_

Sets _aStream_ to read the object just after the next occurrence of _anObject_ and answer `true`.
If _anObject_ is not found before the end of the stream is encountered, answers `false`.

Skip to an object:

```
>>> let stream = 1:9.asStream;
>>> stream.skipTo(7);
>>> stream.upToEnd
8:9
```

* * *

See also: skip

References:
_Smalltalk_
5.9.2.10
