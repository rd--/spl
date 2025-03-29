# WeightedData

- _WeightedData(x, w)_

A `Type` representing observations _x_ with weights _w_.

Compute a weighted `mean`, `variance` and `standardDeviation`:

```
>>> let x = [8 3 5 4 9 0 4 2 2 3];
>>> let w = [0.15 0.09 0.12 0.10 0.16 0.0 0.11 0.08 0.08 0.09];
>>> let d = WeightedData(x, w);
>>> (
>>> 	x.mean, d.mean,
>>> 	x.sampleVariance, d.sampleVariance,
>>> 	x.variance, d.variance,
>>> 	x.standardDeviation, d.standardDeviation
>>> )
(
	4, 5.0408,
	6.8, 6.4064,
	7.5556, 7.2659,
	2.7487, 2.6955
)
```

* * *

See also: List, mean, standardDeviation, variance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/WeightedData.html),
_W_
[1](https://en.wikipedia.org/wiki/Weighted_arithmetic_mean)
