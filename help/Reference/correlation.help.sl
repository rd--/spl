# correlation

- _correlation(v, w)_

Answer the correlation between the vectors _v_ and _w_.

Correlation between two fractional vectors:

```
>>> correlation([5 3/4 1], [2 1/2 1])
2 * (3 / 13).sqrt
```

Correlation between two irrational vectors:

```
>>> correlation([1 pi 2], [2 2 1])
(-3 + pi) / (2 * (3 - 3.pi + pi.squared).sqrt)
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
>>> let m = [1 2 3 4; 2 1 2 3; 3 2 1 2; 4 3 2 1];
>>> let x = 2/5.sqrt;
>>> correlation(m, m)
[
	1 x x.negated -1;
	x 1 0 x.negated;
	x.negated 0 1 x;
	-1 x.negated x 1
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

See also: centralMoment, covariance, variance

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Correlation.html)
[2](https://reference.wolfram.com/language/ref/Correlation.html)

Categories: Statistics
