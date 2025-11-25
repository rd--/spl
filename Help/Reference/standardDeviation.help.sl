# standardDeviation

- _standardDeviation(c)_

Answer an unbiased estimate of the variance of the collection _c_, using Bessel’s correction.

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

The square of the standard deviation is the variance:

```
>>> [1 2 3 4].variance
5/3

>>> [1 2 3 4].standardDeviation
5/3.sqrt
```

Standard deviation is a scaled `norm` of deviations from the `mean`,
and the square root of a scaled central moment:

```
>>> let r = Sfc32(367814);
>>> let n = 20;
>>> let x = r.randomReal([0 10], [n]);
>>> (
>>> 	x.standardDeviation,
>>> 	(x - x.mean).norm / (n - 1).sqrt,
>>> 	(x.centralMoment(2) * n / (n - 1)).sqrt
>>> )
(2.4402, 2.4402, 2.4402)
```

* * *

See also: mean, sampleStandardDeviation, variance

Guides: Statistics Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StandardDeviation.html)
[2](https://mathworld.wolfram.com/BesselsCorrection.html)
[3](https://reference.wolfram.com/language/ref/StandardDeviation.html)

Unicode: U+03C3 σ Greek Small Letter Sigma

Categories: Statistics
