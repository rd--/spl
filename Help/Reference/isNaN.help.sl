# isNaN

- _isNaN(x)_

Answer `true` if _x_ is not a number, abbreviated `NaN`.

```
>>> NaN.isNaN
true

>>> Infinity.isNaN
false

>>> (0 / 0).isNaN
true
```

Not a number is a `SmallFloat` value:

```
>>> NaN.isSmallFloat
true
```

Complex `NaN` become `NaN` on construction:

```
>>> let z = 2J3 / 0;
>>> (z.isComplex, z.isNaN)
(false, true)
```

* * *

See also: NaN, SmallFloat, isFinite, isNaN

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NaN.html),
_W_
[1](https://en.wikipedia.org/wiki/NaN)
