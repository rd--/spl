# nextPut

- _nextPut(s, x)_

Write the object _x_ into the stream _s_.

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
