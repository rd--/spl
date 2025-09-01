# upTo

- _upTo(s, x)_

Answer a collection of all of the items in the stream _s_ up to,
but not including,
the next occurrence of the object _x_.
Sets the stream to read the object just after the next occurrence of _x_.

```
>>> let s = [1 .. 9].asStream;
>>> (s.upTo(5), s.upToEnd)
([1 2 3 4], [6 7 8 9])
```

If _x_ is not found and the end of the stream is encountered, the objects read are answered.

```
>>> 1:9.asStream.upTo(11)
1:9
```

At `BlockStream`:

```
>>> let a = [1 .. 11].asStream;
>>> let b = a.reject(isEven:/1);
>>> (b.upTo(7), b.upToEnd)
([1 3 5], [9 11])
```

* * *

See also: Iterator, next, Stream, upToEnd

Guides: Stream Functions

References:
_Smalltalk_
5.9.2.11

Categories: Accessing
