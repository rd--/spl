# covariance

- _covariance(v | a, w | b)_

Answer the covariance between the vectors _v_ and _w_, or the matrices _a_ and _b_.

```
>>> [1 3/2].covariance([2 11])
9/4

>>> [1.5 3 5 10].covariance([2 1.25 15 8])
11.2604

>>> [1 2 5 6].covariance([2 3 6 8])
6.5

Covariance between vectors of complexes:

```
>>> let v = [2J1 3J-2 5J4];
>>> let w = [0J1 1J2 10J-5];
>>> v.covariance(w)
((-7 / 3) + (0J56 / 3))
```

Covariance between an identity matrix and itself

```
>>> let m = 3.identityMatrix;
>>> m.covariance(m)
[
	 1/3 -1/6 -1/6;
	-1/6  1/3 -1/6;
	-1/6 -1/6  1/3
]
```

Covariance between an sparse matrix and itself

```
>>> let m = [0 0 0; 0 1 0; 0 0 0; 0 0 0; 0 0 2];
>>> m.covariance(m)
[
	0   0     0;
	0   1/5  -1/10;
	0  -1/10  4/5
]
```

* * *

See also: centralMoment, correlation, variance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Covariance.html)
