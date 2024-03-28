# isSuperparticular

- _isSuperparticular(aFraction)_

Answer `true` if _aFraction_ is a superparticular ratio, else `false`.

A superparticular, or epimoric ratio, is the ratio of two consecutive integer numbers.

```
>>> 2/1.isSuperparticular
true

>>> 2/3.isSuperparticular
false

>>> 2:9.r(1:8).allSatisfy(isSuperparticular:/1)
true

>>> 2:9.r(1:8).ratioToCents.rounded
[1200 702 498 386 316 267 231 204]
```

* * *

