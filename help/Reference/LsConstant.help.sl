# LsConstant

- _LsConstant(anObject)_

If _anObject_ is a stream, answer it,
else answer a stream that will answer _anObject_ forever.

```
>>> LsConstant(1).next(3)
[1 1 1]

>>> LsConstant(LsSeries(1, 1, 3)).upToEnd
[1 2 3]
```

* * *

See also: LsForever, LsOnce
