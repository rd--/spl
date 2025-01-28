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

In particular, `Infinity`` is a `SmallFloat`:

```
>>> Infinity.isSmallFloat
true
```

`Infinity` is not finite:

```
>>> Infinity.isFinite
false
```

* * *

See also: e, inf, NaN, pi
