# khinchinsConstant

- _khinchinsConstant(n)_

Answer _n_ times Khinchin’s constant.

```
>>> 1.khinchinsConstant
2.68545
```

Continued fraction:

```
>>> 1.khinchinsConstant
>>> .continuedFraction(18)
[2 1 2 5 1 1 2 1 1 3 10 2 1 3 2 24 1 3]
```

Khinchin’s constant is also stored as a named constant with higher precision,
OEIS [A002210](https://oeis.org/A002210):

```
>>> let n = 'KhinchinsConstant';
>>> let k = n.namedConstant;
>>> (k, k.scale)
(2.68545, 104)
```

Scatter plot of the digits of Khinchin’s constant:

~~~spl svg=A
'KhinchinsConstant'
.namedConstant
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/khinchinsConstant-A.svg)

* * *

See also: arithmeticGeometricMean, continuedFraction, levysConstant

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KhinchinsConstant.html)
[2](https://reference.wolfram.com/language/ref/Khinchin.html),
_OEIS_
[1](https://oeis.org/A002210)
[2](https://oeis.org/A002211),
_W_
[1](https://en.wikipedia.org/wiki/Khinchin%27s_constant)
