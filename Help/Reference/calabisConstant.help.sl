# calabisConstant

- _calabisConstant(n, m)_

Answer _n_ times Calabi’s constant.

```
>>> 1.calabisConstant
1.55139
```

Continued fraction,
OEIS [A046096](https://oeis.org/A046096):

```
>>> 1.calabisConstant
>>> .continuedFraction(18)
[1 1 1 4 2 1 2 1 5 2 1 3 1 1 390 1 1 2]
```

The binary case answers a `Decimal` value with _m_ decimal places:

```
>>> 1.calabisConstant(34)
1.5513875245483203922619525102646238D
```

Calabi’s constant is also stored as a named constant with higher precision,
and this stored value gives the upper limit for _m_,
OEIS [A046095](https://oeis.org/A046095):

```
>>> let n = 'CalabisConstant';
>>> let k = n.namedConstant;
>>> (k, k.scale)
(1.55139, 101)
```

Scatter plot of the digits of Calabi’s constant:

~~~spl svg=A
1.calabisConstant(101)
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/calabisConstant-A.svg)

* * *

See also: Triangle

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CalabisTriangle.html),
_OEIS_
[1](http://oeis.org/A046095),
_W_
[1](https://en.wikipedia.org/wiki/Calabi_triangle)
