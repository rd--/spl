# detectIndex

- _detectIndex(aSequence, aBlock:/1)_

Answer the index of the first item that answers `true` to _aBlock_.
Answer `nil` if there is no such item.

```
>>> 9:1.detectIndex(isEven:/1)
2

>>> 1:9.detectIndex(isZero:/1)
nil
```

* * *

See also: detect, indexOf
