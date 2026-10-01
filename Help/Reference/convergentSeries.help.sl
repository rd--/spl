# convergentSeries

- _convergentSeries(f/1, i=0, j=∞, k=1, ε=1E-16, g/2=+)_

A convergent series is a series that approaches some limit.
Implements both sums and products.
The sum, or product, runs from _i_ to _j_ in steps of size _k_.
The series is said to have converged if the difference between steps falls below ε.

Approximate an infinite sum numerically:

```
>>> { :i |
>>> 	-5 ^ i / i.factorial
>>> }.convergentSeries(0)
0.00673795

>>> -5.exp
0.00673795
```

Sum the even terms of a series:

```
>>> { :i |
>>> 	1 / (2 ^ i)
>>> }.convergentSeries(0, Infinity, 2, 1E-16, +)
1.33333

>>> { :i |
>>> 	1 / (2 ^ (2 * i))
>>> }.convergentSeries(0)
1.33333
```

Approximate the sum of the reciprocals of the Fibonacci numbers:

```
>>> { :i |
>>> 	1 / i.fibonacci
>>> }.convergentSeries(1)
3.35989
```

Maclaurin series for calculating the error function:

```
>>> let z = 3.5J-2.5;
>>> let c = 2 / 1.pi.sqrt;
>>> c * { :n |
>>> 	let m = (2 * n + 1);
>>> 	((-1 ^ n) * (z ^ m))
>>> 	/
>>> 	(n.factorial * m)
>>> }.convergentSeries(0)
0.9997653J0.0002203
```

Approximate an infinite product numerically:

```
>>> { :i |
>>> 	1 + (1 / i.square)
>>> }.convergentSeries(
>>> 	1, Infinity, 1, 1E-9, *
>>> )
3.67608
```

Approximate the value of a finite product:

```
>>> { :i |
>>> 	1 + ((-1 ^ i) / i.square)
>>> }.convergentSeries(
>>> 	100, 10_000, 1, 1E-7, *
>>> )
1.00005
```

Using `log` and `exp` to estimate a product:

```
>>> { :n |
>>> 	((4 * n.square) / (4 * n.square - 1)).log
>>> }.convergentSeries(
>>> 	1, Infinity, 1, 1E-10, +
>>> ).exp
1.5708
```

Calculate product directly:

```
>>> { :n |
>>> 	(4 * n.square) / (4 * n.square - 1)
>>> }.convergentSeries(
>>> 	1, Infinity, 1, 1E-10, *
>>> )
1.5708
```

Estimate the infinite product of a Bessel J sequence:

```
>>> { :n |
>>> 	0.besselJ(1 / n)
>>> }.convergentSeries(
>>> 	1, Infinity, 1, 1E-10, *
>>> )
0.650397
```

Use a product representation to approximate the `sin` function:

```
>>> let x = 0.5;
>>> x * { :k |
>>> 	1 - (x.square / (1.pi.square * k.square))
>>> }.convergentSeries(
>>> 	1, Infinity, 1, 1E-10, *
>>> )
0.479426

>>> 0.5.sin
0.479426
```

* * *

See also: product, sum

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ConvergentSeries.html)
[2](https://reference.wolfram.com/language/ref/NSum.html)
[3](https://reference.wolfram.com/language/ref/NProduct.html),
_W_
[1](https://en.wikipedia.org/wiki/Convergent_series)
