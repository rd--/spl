# covariance

- _covariance(v, w)_

Answer the covariance between the vectors or matrices _v_ and _w_.

Covariance between vectors of real numbers:

```
>>> [1 3/2].covariance([2 11])
9/4

>>> [1.5 3 5 10].covariance([2 1.25 15 8])
11.2604

>>> [1 2 5 6].covariance([2 3 6 8])
6.5
```

Covariance between vectors of complex numbers:

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

Covariance between a sparse matrix and itself

```
>>> let m = [
>>> 	0 0 0;
>>> 	0 1 0;
>>> 	0 0 0;
>>> 	0 0 0;
>>> 	0 0 2
>>> ];
>>> m.covariance(m)
[
	0   0     0;
	0   1/5  -1/10;
	0  -1/10  4/5
]
```

The diagonal of a covariance matrix is the variance:

```
>>> let r = Sfc32(278914);
>>> let x = r.randomReal([0 5], [20 5]);
>>> let y = x.covariance(x).diagonal;
>>> (y, y = x.variance)
([1.2237 2.3543 2.3290 2.2087 1.6632], true)
```

Compute the covariance for a `gcd` array:

~~~spl png=A
let m = gcd:/2.table(1:100, 1:100);
(1 - m.covariance(m).rescale).Graymap
~~~

![](sw/spl/Help/Image/covariance-A.png)

The covariance tends to be large only on the diagonal of a random matrix:

~~~spl png=B
let r = Sfc32(278914);
let m = r.randomReal([-1 1], [100 100]);
(1 - m.covariance(m).rescale).Graymap
~~~

![](sw/spl/Help/Image/covariance-B.png)

* * *

See also: centralMoment, correlation, variance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Covariance.html)

Categories: Statistics
