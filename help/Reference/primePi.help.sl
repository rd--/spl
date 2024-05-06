# primePi

- _primePi(anInteger)_

Answer the number of primes less than or equal to _anInteger_.

Compute the number of primes up to 15:

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

Count the prime numbers up to 9999 & 99999:

```
>>> 9999.primePi
1229

>>> 99999.primePi
9592
```

Plot the prime counting function:

~~~
1:100.collect(primePi:/1).discretePlot
~~~

* * *

See also: eulerPhi, nextPrime, primesList, primesUpTo, sieveOfEratosthenes

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PrimePi.html)
