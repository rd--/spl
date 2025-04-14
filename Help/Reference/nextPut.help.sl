# nextPut

- _nextPut(aStream, anObject)_

Write _anObject_ into _aStream_.

```
>>> let s = [].asWriteStream;
>>> s.nextPut('a');
>>> s.nextPut('b');
>>> (s.upToEnd, s.contents)
([], ['a' 'b'])
```

* * *

See also: nextPutAll, putOn, Stream, WriteStream

Guides: Stream Functions

References:
_Smalltalk_
5.9.4.3

Categories: Accessing
