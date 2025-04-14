# upToPosition

- _upToPosition(aStream, anInteger)_

Read from current up to indicated position:

```
>>> let s = [9 8 7 6 5 4 3 2 1].asStream;
>>> (s.upToPosition(3), s.upToEnd)
([9 8 7], [6 5 4 3 2 1])
```

* * *

See also: upTo, upToEnd
