# vanDerCorputsConstant

- _vanDerCorputsConstant(n, m)_

Answer _n_ times Van der Corput’s constant.

```
>>> 1.vanDerCorputsConstant
3.364318
```

The binary case answers a `Decimal` value with _m_ decimal places:

```
>>> 1.vanDerCorputsConstant(34)
3.3643175781558991060677133865034412D
```

Also stored as a named constant with higher precision,
and this stored value gives the upper limit for _m_,
OEIS [A143305](https://oeis.org/A143305):

~~~spl svg=A
1.vanDerCorputsConstant(104)
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/vanDerCorputsConstant-A.svg)

* * *

See also: namedConstant

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/vanderCorputsConstant.html),
_OEIS_
[1](https://oeis.org/A143305)
