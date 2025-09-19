# bindRight

- _bindRight(f:/2, x)_

Answer a unary `Block` that evaluates the binary block _f_ with the object _x_ bound to the second, or right, argument.

```
>>> [1 .. 5].collect(+.bindRight(4))
[5 .. 9]

>>> [5 .. 9].collect(-.bindRight(4))
[1 .. 5]
```

* * *

See also: bindLeft, constant

Guides: Block Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Bind)
