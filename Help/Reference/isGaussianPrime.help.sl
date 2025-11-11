# isGaussianPrime

- _isGaussianPrime(a+bi)_

Gaussian primes are Gaussian integers satisying one of three properties (see References below).

```
>>> 2J1.isGaussianPrime
true

>>> 5J0.isGaussianPrime
false

>>> [11J3 1J8 3J1 2I 3I]
>>> .select(isGaussianPrime:/1)
[3I]
```

The first few primes which are also Gaussian primes,
OEIS [A002145](https://oeis.org/A002145),

```
>>> 0:99.select { :each |
>>> 	each.j(0).isGaussianPrime
>>> }
[
	 3  7 11 19 23 31 43 47 59 67
	71 79 83
]
```

The Guassian integers with components in _(-5, -1)_ that are prime:

```
>>> (-5 .. -1).tuples(2).select { :each |
>>> 	each.listToComplex.isGaussianPrime
>>> }
[
	-5 -4; -5 -2; -4 -5; -4 -1; -3 -2; -2 -5;
	-2 -3; -2 -1; -1 -4; -1 -2; -1 -1
]
```

Recognize Gaussian Mersenne primes,
prime numbers _n_ such that _1J1^n - 1_ is a Gaussian prime.

```
>>> 1:30.select { :each |
>>> 	each.isPrime & {
>>> 		let n = (1J1 ^ each - 1);
>>> 		n.isGaussianPrime
>>> 	}
>>> }
[2 3 5 7 11 19 29]
```

The `absSquare` of a Gaussian prime is always a non-negative integer:

```
>>> 10J7.absSquare
149

>>> 11J-4.absSquare
137
```

Plot Gaussian primes in the complex plane:

~~~spl svg=A
{ :a :b |
	let c = Complex(a, b);
	c.isGaussianPrime.if {
		c.realImaginary
	} {
		nil
	}
}.table(-11:11, -11:11)
.flatten(1)
.select(isNotNil:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/isGaussianPrime-A.svg)

Plot a 200×200 matrix of Gaussian primes in the complex plane:

~~~spl png=B
{ :a :b |
	Complex(a, b)
	.isGaussianPrime
	.boole
}.table(-99:99, -99:99)
.Bitmap
~~~

![](sw/spl/Help/Image/isGaussianPrime-B.png)

* * *

See also: isEisensteinPrime, isPrime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GaussianPrime.html)
[2](https://reference.wolfram.com/language/ref/PrimeQ.html)
_OEIS_
[1](https://oeis.org/A002145)
_W_
[1](https://en.wikipedia.org/wiki/Gaussian_prime)
