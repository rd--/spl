# aperysConstant

- _aperysConstant(n)_

Apéry’s constant,
ζ(3),
the infinite sum of the reciprocals of the positive integers,
cubed.

```
>>> 1.aperysConstant
1.20206

>>> zeta(3)
1.aperysConstant
```

Apéry’s constant is also stored as a named constant with higher precision,
OEIS [A002117](https://oeis.org/A002117):

```
>>> let n = 'AperysConstant';
>>> let k = n.namedConstant;
>>> (k.asFloat, k.scale)
(1.202057, 107)
```

Scatter plot of the digits of Apéry’s constant:

~~~spl svg=A
'AperysConstant'
.namedConstant
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/aperysConstant-A.svg)

* * *

See also: catalansConstant, namedConstant, zeta

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AperysConstant.html),
_OEIS_
[1](http://oeis.org/A002117),
_W_
[1](https://en.wikipedia.org/wiki/Ap%C3%A9ry%27s_constant)
