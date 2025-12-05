# catalansConstant

- _catalansConstant(n)_

Catalans’s constant,
the alternating sum of the reciprocals of the odd square numbers.

```
>>> 1.catalansConstant
0.91597

>>> 1 / (1.catalansConstant ^ 100)
6487.6

>>> 1.catalansConstant
>>> .continuedFraction(14)
[0 1 10 1 8 1 88 4 1 1 7 22 1 2]
```

The binary case answers a `Decimal` value with _m_ decimal places:

```
>>> 1.catalansConstant(34)
0.9159655941772190150546035149323841D
```

Catalans’s constant is also stored as a named constant with higher precision,
and this stored value gives the upper limit for _m_,
OEIS [A006752](https://oeis.org/A006752):

```
>>> let n = 'CatalansConstant';
>>> let k = n.namedConstant;
>>> (k, k.scale)
(0.915965, 105)
```

Scatter plot of the digits of Catalans’s constant:

~~~spl svg=A
1.catalansConstant(105)
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/catalansConstant-A.svg)

* * *

See also: catalansConstant

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CatalansConstant.html)
[2](https://reference.wolfram.com/language/ref/Catalan.html),
_OEIS_
[1](https://oeis.org/A006752),
_W_
[1](https://en.wikipedia.org/wiki/Catalan%27s_constant)
