# upToPosition

- _upToPosition(s, n)_

Answer the items at the stream _s_ from the current position up to position _n_.

Read from current up to indicated position:

```
>>> let s = [9 8 7 6 5 4 3 2 1].asStream;
>>> (s.upToPosition(3), s.upToEnd)
([9 8 7], [6 5 4 3 2 1])
```

* * *

See also: upTo, upToEnd

Guides: Stream Functions
