# ArithmeticProgression

`ArithmeticProgression` is a `Trait`.

The required methods are `start`, `step` and `size`.

`Range` implements `ArithmeticProgression`.

The `sum` of a finite arithmetic progression has a closed form:

```
>>> (2, 5 .. 14).sum
40

>>> 5 * (2 + 14) / 2
40

>>> (-3/2, -1/2 .. 1/2).sum
-3/2

>>> 3 * (-3/2 + 1/2) / 2
-3/2
```

The `product` of a finite arithmetic progression has a closed form:

```
>>> (1, 3 .. 19).product
654729075

>>> (2 ^ 10) * (10.5.gamma / 0.5.gamma)
654729075

>>> (3, 8 .. 248).product
3.78438E98

>>> (5 ^ 50) * ((3 / 5 + 50).gamma / (3 / 5).gamma)
3.78438E98
```

* * *

See also: arithmeticSeries, geometricSeries, Range

Guides: Range Syntax

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ArithmeticProgression.html)
_W_
[1](https://en.wikipedia.org/wiki/Arithmetic_progression)
