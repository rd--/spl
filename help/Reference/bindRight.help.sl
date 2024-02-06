# bindRight

_bindRight(aBlock:/2, anObject)_

Answer a unary Block that evaluates _aBlock_ with _anObject_ bound to the second (right) argument.

```
>>> [1 .. 5].collect(+.bindRight(4))
[5 .. 9]

>>> [5 .. 9].collect(-.bindRight(4))
[1 .. 5]
```

* * *

See also: bindLeft, constant

References:
_Apl_
[1](https://aplwiki.com/wiki/Bind)
