# nextPutAll

- _nextPutAll(aStream, aCollection)_

Enumerates _aCollection_, adding each element to _aStream_.

```
>>> let stream = ByteArray(0).asWriteStream;
>>> stream.nextPutAll(0:255);
>>> stream.contents
0:255.asByteArray
```

* * *

See also: nextPut, putOn, Stream, WriteStream

References:
_Smalltalk_
5.9.4.4
