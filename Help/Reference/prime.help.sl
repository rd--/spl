# prime

- _prime(n)_

Answer the _n_--th prime number.  The first prime number is two.

```
>>> 5.prime
11

>>> 10.prime
29

>>> 2002.prime
17401

>>> 3579.prime
33413
```

The inverse is `primePi`:

```
>>> 33413.primePi
3579
```

Threads over lists:

```
>>> 1:9.prime
[2 3 5 7 11 13 17 19 23]

>>> (10 ^ 1:3).prime
[29 541 7919]
```

This value is cached (memoized) by the system,
so that subsequent accesses do not require recalculation:

```
>>> system.cachedPrimesList[5]
11

>>> 10001.prime
104743
```

Plot first fifty primes:

~~~spl svg=A
1:50.functionPlot(prime:/1)
~~~

![](sw/spl/Help/Image/prime-A.svg)

Generate a path based on the prime sequence:

~~~spl svg=B
1:500.collect { :n |
	n.prime
}.anglePath.Line
~~~

![](sw/spl/Help/Image/prime-B.svg)

* * *

See also: indexOfPrime, isPrime, nextPrime, primesList, primesUpTo

Guides: Prime Number Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/pco),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=ithprime),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Prime.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Integer.html#-nthPrime)

Categories: Math
