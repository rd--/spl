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

At Integer:

```
>>> 5.logGamma
24.log
```

Plot over a subset of the reals:

```
(0.02, 0.04 .. 5).collect(logGamma:/1).plot
```

* * *

See also: factorial, gamma

References:
_Mathematica_
[1](http://mathworld.wolfram.com/GammaFunction.html)
[2](https://reference.wolfram.com/language/ref/LogGamma.html)
