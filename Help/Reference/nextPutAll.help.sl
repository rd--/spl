# nextPutAll

- _nextPutAll(aStream, aCollection)_

Enumerates _aCollection_, adding each element to _aStream_.

```
>>> let s = ByteArray(0).asWriteStream;
>>> s.nextPutAll([0 .. 255]);
>>> s.contents
[0 .. 255].asByteArray
```

* * *

See also: nextPut, putOn, Stream, WriteStream

References:
_Smalltalk_
5.9.4.4
