# pythagorasConstant

- _pythagorasConstant(n)_

Answer _n_ times Pythagoras’ constant,
the square root of two.

```
>>> 1.pythagorasConstant
2.sqrt

>>> 1.pythagorasConstant
2 ^ 0.5
```

The fraction _99/70_ is a reasonable simple approximation:

```
>>> 1.pythagorasConstant
99/70

>>> 1.pythagorasConstant.asFraction
577/408
```

It is the Euclidean distance from _(0,0)_ to _(1,1)_,
which is the norm of _(1,1)-(0,0)_:

```
>>> euclideanDistance([0 0], [1 1])
2.sqrt

>>> [1 1].norm
2.sqrt
```

The binary case answers a `Decimal` value with _m_ decimal places:

```
>>> 1.pythagorasConstant(34)
1.4142135623730950488016887242096980D
```

Pythagoras’ constant is also stored as a named constant with higher precision,
and this stored value gives the upper limit for _m_,
OEIS [A002193](https://oeis.org/A002193):

```
>>> let n = 'PythagorasConstant';
>>> let k = n.namedConstant;
>>> (k, k.scale)
(1.414214, 98)
```

Scatter plot of the digits of Pythagoras’ constant:

~~~spl svg=A
1.pythagorasConstant(98)
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/pythagorasConstant-A.svg)

* * *

See also: e, pi, sqrt

Guides: Mathematical Constants

References:
_OEIS_
[1](https://oeis.org/A002193),
_W_
[1](https://en.wikipedia.org/wiki/Square_root_of_2)

Unicode: U+03C0 π Greek Small Letter Pi

Categories: Math, Constant
