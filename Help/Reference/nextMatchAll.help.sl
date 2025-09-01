# nextMatchAll

- _nextMatchAll(s, x)_

Reads the next _x.size_ objects from the stream _s_ and answer `true` if the objects are equivalent to the sequence _x_,
and `false` if not.

```
>>> let s = [1 3 5 7 9].asIterator;
>>> (s.nextMatchAll([1 3 5]), s.next)
(true, 7)
```

* * *

See also: next, nextMatchFor, peekFor, Stream

Guides: Stream Functions

Categories: Accessing
