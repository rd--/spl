# isGaussianPrime

_isGaussianPrime(aComplex)_

Gaussian primes are Gaussian integers satisying one of three properties (see References below).

```
>>> 2j1.isGaussianPrime
true

>>> 5j0.isGaussianPrime
false
```

The primes up to 43 which are also Gaussian primes are:

```
>>> 1:43.select { :each | each.j(0).isGaussianPrime }
[3 7 11 19 23 31 43]
```

The Guassian integers with components in _-5:-1_ that are prime:

```
>>> -5:-1.tuples(2).select { :each | each.asComplex.isGaussianPrime }
[-5 -4; -5 -2; -4 -5; -4 -1; -3 -2; -2 -5; -2 -3; -2 -1; -1 -4; -1 -2; -1 -1]
```

Recognize Gaussian Mersenne primes,
prime numbers _n_ such that _1j1^n - 1_ is a Gaussian prime.

```
>>> 1:30.select { :each | each.isPrime & { (1j1 ^ each - 1).isGaussianPrime } }
[2, 3, 5, 7, 11, 19, 29]
```

* * *

See also: isPrime

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GaussianPrime.html)
[2](https://reference.wolfram.com/language/ref/PrimeQ.html)
