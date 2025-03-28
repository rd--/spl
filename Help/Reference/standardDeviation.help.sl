# standardDeviation

- _standardDeviation(aCollection)_

Answer an unbiased estimate of the variance of _aCollection_, using Bessel’s correction.

The standard deviation is the square root of the `variance`.

```
>>> [1.21 3.4 2 4.66 1.5 5.61 7.22]
>>> .standardDeviation
2.27183

>>> [5.2 5.3 5.4].standardDeviation
0.1

>>> [7 8 9].standardDeviation
1

>>> let d = [2 4 4 4 5 5 7 9];
>>> (
>>> 	d.mean,
>>> 	d.variance,
>>> 	d.standardDeviation,
>>> 	d.sampleVariance,
>>> 	d.sampleStandardDeviation
>>> )
(5, 32 / 7, (32 / 7).sqrt, 4, 2)
```

Standard deviation at a matrix is column-wise:

```
>>> [
>>> 	1 0 4;
>>> 	0 2 0;
>>> 	0 0 3
>>> ]
>>> .standardDeviation
[
	1 / 3.sqrt,
	2 / 3.sqrt,
	(13 / 3).sqrt
]
```

* * *

See also: mean, sampleStandardDeviation, variance

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StandardDeviation.html)
[2](https://mathworld.wolfram.com/BesselsCorrection.html)
[3](https://reference.wolfram.com/language/ref/StandardDeviation.html)

Categories: Statistics
