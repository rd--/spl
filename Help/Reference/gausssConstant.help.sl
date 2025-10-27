# gausssConstant

- _gausssConstant(n)_

Answer _n_ times Gauss’s constant _G_,
the reciprocal of the arithmetic-geometric mean of 1 and √2.

```
>>> 1.gausssConstant
0.834627

>>> 1 / 1.arithmeticGeometricMean(
>>> 	2.sqrt
>>> )
0.834627
```

Relation to `gamma` and `ellipticK`:

```
>>> (2.pi ^ -1.5) * (gamma(0.25) ^ 2)
0.834627

>>> (2 * -1.ellipticK) / 1.pi
0.834627
```

Lemniscate constant:

```
>>> 1.gausssConstant * 1.pi
1.lemniscateConstant
```

Continued fraction,
OEIS [A053003](https://oeis.org/A053003):

```
>>> 1.gausssConstant
>>> .continuedFraction(16)
[0 1 5 21 3 4 14 1 1 1 1 1 3 1 15 1]
```

Multiplicative inverse:

```
>>> (1 / 1.gausssConstant)
1.198140

>>> (1 / 1.gausssConstant)
>>> .continuedFraction(15)
[1 5 21 3 4 14 1 1 1 1 1 3 1 15 1]
```

Ubiquitous constant:

```
>>> (1 / 1.gausssConstant) / 2.sqrt
0.847213
```

Gausss’s constant is also stored as a named constant with higher precision,
OEIS [A014549](http://oeis.org/A014549):

```
>>> let n = 'GausssConstant';
>>> let k = n.namedConstant;
>>> (k, k.scale)
(0.834627, 107)
```

Scatter plot of the digits of Gausss’s constant:

~~~spl svg=A
'GausssConstant'
.namedConstant
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/gausssConstant-A.svg)

The continued fraction at the higher precision decimal constant is accurate to many more places:

```
>>> 'GausssConstant'
>>> .namedConstant
>>> .continuedFraction(100)
[
	0 1  5 21  3 4 14 1  1  1
	1 1  3  1 15 1  3 8 36  1
	2 5  2  1  1 2  2 6  9  1
	1 1  3  1  2 6  1 5  1  1
	2 1 13  2  2 5  1 2  2  1
	5 1  3  1  3 1  2 2  2  2
	8 3  1  2  2 1 10 2  2  2
	3 3  1  7  1 8  3 1  1  1
	1 1  1  1  1 5  2 1  2 17
	1 4 31  2  2 5 30 1  8  2
]
```

Log scale scatter plot of the continued fraction:

~~~spl svg=B
'GausssConstant'
.namedConstant
.continuedFraction(100)
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/gausssConstant-B.svg)

* * *

See also: arithmeticGeometricMean, ellipticK, gamma, lemniscateConstant, sqrt

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GausssConstant.html)
[2](https://mathworld.wolfram.com/UbiquitousConstant.html),
_OEIS_
[1](https://oeis.org/A053002)
[2](https://oeis.org/A053003)
[3](https://oeis.org/A014549),
_W_
[1](https://en.wikipedia.org/wiki/Lemniscate_constant)
