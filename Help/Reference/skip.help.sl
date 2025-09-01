# skip

- _skip(s, n)_

Skips the next _k_ objects in the stream _s_,
where _k_ is a number of objects equal to the lesser of _n_ and the number of remaining items in _s_.

Relative re-positioning:

```
>>> let s = [1 2 3 4 5].asStream;
>>> s.position(3);
>>> s.skip(-1);
>>> s.next
3
```

Skip to a position:

```
>>> let s = [1 3 5 7 9].asStream;
>>> s.skip(2);
>>> s.upToEnd
[5 7 9]
```

* * *

See also: asStream, position, next, skipTo

Guides: Stream Functions

References:
_Smalltalk_
5.9.2.9

Categories: Accessing, Stream
