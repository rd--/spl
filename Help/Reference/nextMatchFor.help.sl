# nextMatchFor

- _nextMatchFor(s, x)_

Read the next object from the stream _s_ and answer `true` if the object is equivalent to _x_,
and `false` if not.

```
>>> let s = 1:9.asIterator;
>>> (s.nextMatchFor(1), s.next)
(true, 2)
```

* * *

See also: next, peekFor, Stream

Guides: Stream Functions

References:
_Smalltalk_
5.9.2.6

Categories: Accessing
