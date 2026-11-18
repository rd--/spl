# absoluteCorrelation

- _absoluteCorrelation(u, v)_

Answer the absolute correlation between the vectors _u_ and _v_.

Absolute correlation between vectors of real numbers:

```
>>> [5/1 3/4 1/1].absoluteCorrelation(
>>> 	[2/1 1/2 1/1]
>>> )
91/24

>>> [1.0 1.pi 2.0].absoluteCorrelation(
>>> 	[2.0 2.0 1.0]
>>> )
(2 * (2 + 1.pi)) / 3

>>> [1.5 3.0 5.0 10.0].absoluteCorrelation(
>>> 	[2.0 1.25 15.0 8.0]
>>> )
40.4375
```

Absolute correlation between vectors of complexes:

```
>>> [2J1 3J-2 5J4].absoluteCorrelation(
>>> 	[0J1 1J2 10J-5]
>>> )
10.0.J(55.0 / 3.0)
```

* * *

See also: absoluteCorrelationFunction, correlation, covariance, moment, standardize

Guides: Statistics Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AbsoluteCorrelation.html)
