# skipTo

- _skipTo(s, x)_

Sets the stream _s_ to read the object just after the next occurrence of _x_ and answer `true`.
If _x_ is not found before the end of the stream is encountered, answers `false`.

Skip to an object:

```
>>> let s = [1 3 5 7 9 11].asStream;
>>> s.skipTo(7);
>>> (s.position, s.upToEnd)
(4, [9 11])
```

* * *

See also: position, skip, upToEnd

Guides: Stream Functions

References:
_Smalltalk_
5.9.2.10

Categories: Accessing, Stream
