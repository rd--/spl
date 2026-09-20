# skip

- _skip(s, n)_

Skips the next _k_ objects in the stream _s_,
where _k_ is a number of objects equal to the lesser of _n_ and the number of remaining items in _s_.
If _n_ is negative, skip backwards, if the stream _s_ allows this.
Answers the position after the skip.

Relative re-positioning:

```
>>> let s = Stream[1 3 5 7 9];
>>> (
>>> 	s.position,
>>> 	s.position(3),
>>> 	s.peek,
>>> 	s.skip(-1),
>>> 	s.next
>>> )
(0, 3, 7, 2, 5)
```

Skip to a position:

```
>>> let s = Stream[1 3 5 7 9];
>>> s.skip(2);
>>> s.upToEnd
[5 7 9]
```

* * *

See also: asStream, position, next, skipTo, Stream

Guides: Stream Functions

References:
_Smalltalk_
5.9.2.9

Categories: Accessing, Stream
