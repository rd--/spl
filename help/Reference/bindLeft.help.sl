# bindLeft

_bindLeft(aBlock:/2, anObject)_

Answer a unary Block that evaluates _aBlock_ with _anObject_ bound to the first (left) argument.

```
>>> [1 .. 5].collect(+.bindLeft(4))
[5 .. 9]

>>> [5 .. 9].collect(-.bindLeft(4))
[-1 .. -5]
```

* * *

See also: bind, bindRight, constant

References:
_Apl_
[1](https://aplwiki.com/wiki/Bind)
