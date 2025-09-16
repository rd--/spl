# isNaN

- _isNaN(x)_

Answer `true` if _x_ is `NaN`.

```
>>> NaN.isNaN
true

>>> Infinity.isNaN
false

>>> 0 / 0
NaN
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
