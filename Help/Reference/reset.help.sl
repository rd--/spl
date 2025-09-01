# reset

- _reset(s)_

Set the position of the stream _s_ to the beginning of the sequence of objects.
Answer `zero`, which is what `position` would answer.

```
>>> let s = [1 .. 9].asStream;
>>> (s.next, s.reset, s.position, s.next)
(1, 0, 0, 1)
```

* * *

See also: ReadStream, WriteStream

Guides: Stream Functions

References:
_Smalltalk_
5.9.1.6

Categories: Positioning
