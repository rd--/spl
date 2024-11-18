# isGaussianPrime

- _isGaussianPrime(aComplex)_

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

# isSquareFree

- _isSquareFree(anInteger)_

Answer `true` if _anInteger_ is square free, else `false`.
An integer is square free if it is divisible by no perfect square other than `one`.

Test whether a number is square free:

```
>>> 10.isSquareFree
true
```

The numbers 4 and 20 are not square free:

```
>>> 4.isSquareFree
false

>>> 20.isSquareFree
false
```

The number 1 is by convention taken to be squarefree:

```
>>> 1.isSquareFree
true
```

The first few squarefree numbers are:

```
>>> 1:15.select(isSquareFree:/1)
[1 2 3 5 6 7 10 11 13 14 15]
```

A number is squareful, or nonsquarefree, if it contains at least one square.
The first few squareful numbers are:

```
>>> 1:25.select { :each | each.isSquareFree.not }
[4 8 9 12 16 18 20 24 25]
```

Plot the first few squarefree numbers:

~~~
1:99.select(isSquareFree:/1).linePlot
~~~

Plot the first few squareful numbers:

~~~
1:99.select { :n | n.isSquareFree.not }.linePlot
~~~

* * *

See also: isPerfectSquare

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Squarefree.html)
[2](https://mathworld.wolfram.com/Squareful.html)
[3](https://reference.wolfram.com/language/ref/SquareFreeQ.html)

Categories: Testing, Math

