# levysConstant

- _levysConstant(n, m)_

Answer _n_ times Lévy’s constant, _exp(β)_.

```
>>> 1.levysConstant
3.27582

>>> 1.levysConstant.log
1.186569

>>> 1.pi.square / (12 * 2.log)
1.186569
```

Continued fraction:

```
>>> 1.levysConstant
>>> .continuedFraction(13)
[3 3 1 1 1 2 29 1 130 1 12 3 8]
```

The binary case answers a `Decimal` value with _m_ decimal places:

```
>>> 1.levysConstant(34)
3.2758229187218111597876818824538438D
```

Lévy’s constant is also stored as a named constant with higher precision,
and this stored value gives the upper limit for _m_,
OEIS [A002210](https://oeis.org/A002210):

```
>>> let n = 'LevysConstant';
>>> let k = n.namedConstant;
>>> (k, k.scale)
(3.27582, 104)
```

Scatter plot of the digits of Lévy’s constant:

~~~spl svg=A
1.levysConstant(104)
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/levysConstant-A.svg)

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
