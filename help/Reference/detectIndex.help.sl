# detectIndex

- _detectIndex(aSequence, aBlock:/1)_

Answer the index of the first item in _aSequence_ that answers `true` to _aBlock_.
Answer `nil` if there is no such item.

```
>>> 9:1.detectIndex(isEven:/1)
2

>>> 1:9.detectIndex(isZero:/1)
nil
```

* * *

See also: bisect, detect, detectIndexIfFoundIfNone, indexOf

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FirstPosition.html),
_W_
[1](https://en.wikipedia.org/wiki/Linear_search)
