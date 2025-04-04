# absoluteCorrelationFunction

- _absoluteCorrelationFunction(x, h)_

Estimates the absolute correlation function at distances _h_ from data _x_.

Estimate the absolute correlation function for at τ=2:

```
>>> [2 3 4 3].absoluteCorrelationFunction([2])
[17/4]
```

Estimate the absolute correlation function for at τ=5:

```
>>> [1 .. 10].absoluteCorrelationFunction([5])
[13]
```

Obtain empirical estimates of the correlation function up to τ=9:

```
>>> [1 .. 10].absoluteCorrelationFunction([0 .. 9])
[77/2 33 138/5 112/5 35/2 13 9 28/5 29/10 1]
```

Compute the absolute correlation function for τ=1-9 in steps of 2:

```
>>> [1 .. 10].absoluteCorrelationFunction([1, 3 .. 9])
[33 112/5 13 28/5 1]
```

Sample absolute correlation function at lag 0 estimates the second `moment`:

```
>>> let x = [1 .. 10];
>>> (
>>> 	x.absoluteCorrelationFunction([0]),
>>> 	x.moment(2)
>>> )
([77/2], 77/2)
```

* * *

See also: correlation, correlationFunction, covariance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CorrelationFunction.html)
