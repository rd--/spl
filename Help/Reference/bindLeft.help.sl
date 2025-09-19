# bindLeft

- _bindLeft(f:/2, x)_

Answer a unary `Block` that evaluates the binary block _f_ with the object _x_ bound to the first, or left, argument.

```
>>> [1 .. 5].collect(+.bindLeft(4))
[5 .. 9]

>>> [5 .. 9].collect(-.bindLeft(4))
[-1 .. -5]
```

* * *

See also: bind, bindRight, constant

Guides: Block Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Bind)

Categories: Evaluating
