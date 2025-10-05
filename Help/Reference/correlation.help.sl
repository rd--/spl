# correlation

- _correlation(v, w)_
- _correlation(a, b)_

Answer the correlation between the vectors _v_ and _w_,
also called the Pearson correlation coefficient,
or the cross-correlation matrix for the matrices _a_ and _b_.

Correlation between two fractional vectors:

```
>>> let u = [5 3/4 1];
>>> let v = [2 1/2 1];
>>> let p = standardDeviation(u);
>>> let q = standardDeviation(v);
>>> (
>>> 	correlation(u, v),
>>> 	covariance(u, v) / (p * q)
>>> )
(
	2 * (3 / 13).sqrt,
	2 * (3 / 13).sqrt
)
```

Perfectly correlated vectors,
the uncentered correlation coefficient is given by `cosineSimilarity`:

```
>>> let u = [1 2 3 5 8];
>>> let v = [0.11 0.12 0.13 0.15 0.18];
>>> (
>>> 	correlation(u, v),
>>> 	cosineSimilarity(u, v)
>>> )
(1, 0.9208)

>>> let u = [1 2 3 5 8];
>>> let v = [0.11 0.12 0.13 0.15 0.18];
>>> let p = u - mean(u);
>>> let q = v - mean(v);
>>> (
>>> 	correlation(p, q),
>>> 	cosineSimilarity(p, q)
>>> )
(1, 1)
```

Correlation between two irrational vectors:

```
>>> correlation([1 1.pi 2], [2 2 1])
(-3 + 1.pi)
/
(2 * (3 - 3.pi + 1.pi.square).sqrt)
```

Correlation between two real vectors:

```
>>> correlation([1.5 3 5 10], [2 1.25 15 8])
0.47597
```

Correlation between two integer vectors:

```
>>> correlation([1 2 5 6], [2 3 6 8])
0.99156
```

Correlation between a Toeplitz matrix and itself:

```
>>> let m = [
>>> 	1 2 3 4;
>>> 	2 1 2 3;
>>> 	3 2 1 2;
>>> 	4 3 2 1
>>> ];
>>> let x = 2/5.sqrt;
>>> correlation(m, m)
[
	 1  x -x -1;
	 x  1  0 -x;
	-x  0  1  x;
	-1 -x  x  1
]
```

Correlation between an identity matrix and itself:

```
>>> let m = 2.identityMatrix;
>>> correlation(m, m)
[
	 1 -1;
	-1  1
]
```

* * *

See also: centralMoment, cosineSimilarity, correlationFunction, covariance, mean, variance

Guides: Statistics Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Correlation.html)
[2](https://reference.wolfram.com/language/ref/Correlation.html),
_W_
[1](https://en.wikipedia.org/wiki/Correlation)
[2](https://en.wikipedia.org/wiki/Pearson_correlation_coefficient)

Categories: Statistics
