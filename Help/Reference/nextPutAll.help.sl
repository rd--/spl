# nextPutAll

- _nextPutAll(s, c)_

Enumerates the collection _c_, adding each element to the stream _s_.

```
>>> let s = ByteArray(0).asWriteStream;
>>> s.nextPutAll([0 .. 255]);
>>> s.contents
[0 .. 255].asByteArray
```

* * *

See also: nextPut, putOn, Stream, WriteStream

Guides: Stream Functions

References:
_Smalltalk_
5.9.4.4
