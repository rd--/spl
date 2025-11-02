# madelungConstant

- _madelungConstant(n)_

Answer _n_ times the Madelung constant.

```
>>> 1.madelungConstant
-1.74756
```

The Madelung constant constant is also stored as a named constant with higher precision,
OEIS [A085469](https://oeis.org/A085469):

```
>>> let n = 'MadelungConstant';
>>> let k = n.namedConstant;
>>> (k, k.scale)
(-1.74756, 101)
```

Scatter plot of the digits of Apéry’s constant:

~~~spl svg=A
'MadelungConstant'
.namedConstant
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/madelungConstant-A.svg)

* * *

See also: namedConstant

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MadelungConstants.html),
_OEIS_
[1](https://oeis.org/A085469),
_W_
[1](https://en.wikipedia.org/wiki/Madelung_constant)
