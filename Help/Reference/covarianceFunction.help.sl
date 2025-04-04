# covarianceFunction

- _covarianceFunction(x, h)_

Estimate the covariance function at specified lags:

```
>>> [2 3 4 3].covarianceFunction([2])
[-1/4]

>>> [1 .. 10].covarianceFunction([9])
[-81/40]

>>> [1 .. 10].covarianceFunction([0 .. 9])
[
	33/4 231/40 17/5 49/40 -13/20
	-17/8 -31/10 -139/40 -63/20 -81/40
]
```

* * *

See also: correlationFunction, correlation, covariance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CovarianceFunction.html)
