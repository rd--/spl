# levysConstant

- _levysConstant(n)_

Answer _n_ times Lévy’s constant, _exp(β)_.

```
>>> 1.levysConstant
3.27582

>>> 1.levysConstant.log
1.186569

>>> 1.pi.squared / (12 * 2.log)
1.186569
```

Continued fraction:

```
>>> 1.levysConstant
>>> .continuedFraction(13)
[3 3 1 1 1 2 29 1 130 1 12 3 8]
```

* * *

See also: continuedFraction, convergents, khinchinsConstant

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LevyConstant.html),
_OEIS_
[1](https://oeis.org/A086702)
[2](https://oeis.org/A086703),
_W_
[1](https://en.wikipedia.org/wiki/L%C3%A9vy%27s_constant)
