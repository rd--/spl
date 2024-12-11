# logGamma

- _logGamma(z)_

Answer the logarithm of the gamma function.

```
>>> 2.5.logGamma
0.284683

>>> (22 / 10).logGamma
0.096947

>>> 3:6.collect(logGamma:/1)
[2 6 24 120].log
```

At `Integer`:

```
>>> 5.logGamma
24.log

>>> 6.logGamma
6.gamma.log
```

At half integer:

```
>>> 0.5.logGamma
0.5724
```

Plot over a subset of the reals:

~~~
(0.02 -- 5).functionPlot(logGamma:/1)
~~~

![](sw/spl/Help/Image/logGamma-A.svg)

* * *

See also: factorial, gamma

References:
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=GAMMA),
_Mathematica_
[1](http://mathworld.wolfram.com/GammaFunction.html)
[2](https://reference.wolfram.com/language/ref/LogGamma.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/gammaln.html)
