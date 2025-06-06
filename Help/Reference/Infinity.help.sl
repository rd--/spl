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

_∞×0_ is not a number:

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

* * *

See also: e, inf, NaN, pi

Unicode: U+221E ∞ Infinity
