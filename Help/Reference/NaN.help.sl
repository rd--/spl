# NaN

`NaN`, standing for not a number, is a numeric constant.

`NaN` is, perhaps confusingly, a number:

```
>>> NaN.isNumber
true
```

In particular, `NaN` is a `SmallFloat`:

```
>>> NaN.isSmallFloat
true
```

`NaN` is not finite:

```
>>> NaN.isFinite
false
```

`NaN` is not equal or even close to itself:

```
>>> NaN = NaN
false

>>> NaN ~ NaN
false
```

Complex `NaN`:

```
>>> let z = 2J3 / 0;
>>> (z.isComplex, z.isNaN)
(true, true)
```

* * *

See also: isFinite, isNaN, Infinity, SmallFloat

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NaN.html),
_W_
[1](https://en.wikipedia.org/wiki/NaN)
