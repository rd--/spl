# primePi

- _primePi(n)_

Answer the number of primes less than or equal to the integer _n_.

Compute the number of primes up to 15 and 100:

```
>>> 15.primePi
6

>>> 100.primePi
25
```

Threads over lists:

```
>>> [3 5 17 25].primePi
[2 3 7 9]
```

The first few terms:

```
>>> 1:23.primePi
[
	0 1 2 2 3 3 4 4 4 4
	5 5 6 6 6 6 7 7 8 8
	8 8 9
]
```

Count the prime numbers up to 9999 & 99999:

```
>>> 9999.primePi
1229

>>> 99999.primePi
9592
```

Plot the prime counting function:

~~~spl svg=A
1:60.collect(primePi:/1).discretePlot
~~~

![](sw/spl/Help/Image/primePi-A.svg)

* * *

See also: eulerPhi, nextPrime, primesList, primesUpTo, sieveOfEratosthenes

Guides: Prime Number Functions

References:
_Mathematica_
[1](http://mathworld.wolfram.com/PrimeCountingFunction.html)
[2](https://reference.wolfram.com/language/ref/PrimePi.html),
_OEIS_
[1](https://oeis.org/A000720),
_W_
[1](https://en.wikipedia.org/wiki/Prime-counting_function)
