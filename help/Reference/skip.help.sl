# skip

- _skip(aStream, amount)_

Skips the next _amount_ objects in _aStream_.

A number of objects equal to the lesser of _amount_ and the number of remaining items in _aStream_.

Relative re-positioning:

```
>>> let stream = 1:5.asStream;
>>> stream.position(3);
>>> stream.skip(-1);
>>> stream.next
3
```

Skip to a position:

```
>>> let stream = (1, 3 .. 9).asStream;
>>> stream.skip(2);
>>> stream.upToEnd
(5, 7 .. 9)
```

* * *

See also: skipTo

References:
_Smalltalk_
5.9.2.9

Categories: Accessing, Stream
