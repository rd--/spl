# isHalfInteger

- _isHalfInteger(x)_

Predicate to decide if the number _x_ is a half integer.

At `Fraction`:

```
>>> 3/2.isHalfInteger
true

>>> 5/4.isHalfInteger
false

>>> 7/1.isHalfInteger
false
```

At `SmallFloat`:

```
>>> 1.5.isHalfInteger
true

>>> [-3 -2.5 0 1.pi 4.5]
>>> .select(isHalfInteger:/1)
[-2.5 4.5]
```

* * *

See also: abs, fractionPart, isOne, isZero

References:
_Mathematica_
[1](https://mathworld.wolfram.com/x.html)
_W_
[1](https://en.wikipedia.org/wiki/Half-integer)
