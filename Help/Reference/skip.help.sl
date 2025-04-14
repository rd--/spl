# skip

- _skip(aStream, amount)_

Skips the next _amount_ objects in _aStream_.

A number of objects equal to the lesser of _amount_ and the number of remaining items in _aStream_.

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

References:
_Smalltalk_
5.9.2.9

Categories: Accessing, Stream
