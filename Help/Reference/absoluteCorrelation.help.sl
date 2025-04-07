# absoluteCorrelation

- _absoluteCorrelation(u, v)_

Answer the absolute correlation between the vectors _u_ and _v_.

Absolute correlation between vectors of real numbers:

```
>>> [5 3/4 1].absoluteCorrelation(
>>> 	[2 1/2 1]
>>> )
91/24

>>> [1 1.pi 2].absoluteCorrelation(
>>> 	[2 2 1]
>>> )
(2 * (2 + 1.pi)) / 3

>>> [1.5 3 5 10].absoluteCorrelation(
>>> 	[2 1.25 15 8]
>>> )
40.4375
```

Absolute correlation between vectors of complexes:

```
>>> [2J1 3J-2 5J4].absoluteCorrelation(
>>> 	[0J1 1J2 10J-5]
>>> )
10.j(55 / 3)
```

* * *

See also: absoluteCorrelationFunction, covariance, correlation, moment, standardize

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AbsoluteCorrelation.html)
