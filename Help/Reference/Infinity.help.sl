# Infinity

`Infinity` is a numeric constant.

`Infinity` is a number:

```
>>> Infinity.isNumber
true
```

`Infinity` may be signed:

```
>>> +Infinity.isPositive
true

>>> -Infinity.isNegative
true
```

In particular, `Infinity` is a `SmallFloat`:

```
>>> Infinity.isSmallFloat
true
```

`Infinity` is not finite:

```
>>> Infinity.isFinite
false
```

```
>>> (0 * Infinity).isNaN
true
```
_∞×0_, `zero` times `Infinity`, is not a number:

```
>>> (Infinity * 0).isNaN
true
```

Neither is _∞-∞_:

```
>>> (Infinity - Infinity).isNaN
true
```

_∞±n_ is ∞:

```
>>> Infinity + 1
Infinity

>>> Infinity - 1
Infinity
```

Arithmetic:

```
>>> 1 / Infinity
0

>>> Infinity * Infinity
Infinity

>>> ((2 * Infinity) - Infinity).isNaN
true
```

Predicates:

```
>>> (10 ^ 100) < Infinity
true
```

Mathematical functions at infinities:

```
>>> -Infinity.exp
0

>>> Infinity.exp
Infinity
```

Infinity answers of mathematical functions:

```
>>> 0.log
-Infinity

>>> 0.gamma
Infinity
```

* * *

See also: e, inf, NaN, pi

References:
_Mathematica_
[1](http://mathworld.wolfram.com/Infinity.html)
[2](https://reference.wolfram.com/language/ref/Infinity.html),
_W_
[1](https://en.wikipedia.org/wiki/Infinity)

Unicode: U+221E ∞ Infinity
