# levysConstant

- _levysConstant(n)_

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

Lévy’s constant is also stored as a named constant with higher precision,
OEIS [A002210](https://oeis.org/A002210):

```
>>> let n = 'LevysConstant';
>>> let k = n.namedConstant;
>>> (k, k.scale)
(2.68545, 104)
```

Scatter plot of the digits of Lévy’s constant:

~~~spl svg=A
'LevysConstant'
.namedConstant
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
