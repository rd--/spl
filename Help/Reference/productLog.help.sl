# productLog

- _productLog(z)_

Answer the principal solution for _w_ in _z=we^w_,
also called the Lambert _W_ function,
also called the omega function.

```
>>> 2.5.productLog
0.958586

>>> let z = 0.958586;
>>> z * z.exp
2.5

>>> (1 / 3).productLog
0.257628

>>> let z = 0.257628;
>>> z * z.exp
1 / 3

>>> (4 / 3).productLog
0.677309

>>> (7 / 3).productLog
0.925125

>>> 0.824361.productLog
0.5

>>> (-1 / 1.e).productLog
-1
```

At `zero` and `one`:

```
>>> 0.productLog
0

>>> 1.productLog
0.567143
```

Decimal expansion of _W
OEIS [A030178](https://oeis.org/A030178):

```
>>> 1.productLog
0.5671432904097838

>>> 1.omegaConstant
0.5671432904097838
```

Decimal expansion of _π/W(π)_,
OEIS [A088928](https://oeis.org/A088928):

```
>>> 1.pi / 1.pi.productLog
2.926064057273156
```

Plot over subset of reals:

~~~spl svg=A
(0 -- 4).functionPlot(productLog:/1)
~~~

![](Help/Image/productLog-A.svg)

Polar plot:

~~~spl svg=B
(0 -- 12.pi).polarPlot(250, productLog:/1)
~~~

![](Help/Image/productLog-B.svg)

* * *

See also: exp, lambertW, log

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LambertW-Function.html)
[2](https://reference.wolfram.com/language/ref/ProductLog.html),
_W_
[1](https://en.wikipedia.org/wiki/Lambert_W_function)

