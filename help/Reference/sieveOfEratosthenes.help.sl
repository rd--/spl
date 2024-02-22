# sieveOfEratosthenes

_sieveOfEratosthenes(anInteger)_

Answer the number of primes less than or equal to _anInteger_.

Up to 99:

```
>>> 99.sieveOfEratosthenes
25

>>> 1:99.select(isPrime:/1).size
25
```

Up to 999:

```
>>> 999.sieveOfEratosthenes
168

>>> 1:999.select(isPrime:/1).size
168
```

Up to 9999:

```
>>> 9999.sieveOfEratosthenes
1229

>>> 1:9999.select(isPrime:/1).size
1229
```


Up to 99999 & 999999:

```
>>> 99999.sieveOfEratosthenes
9592

>>> 999999.sieveOfEratosthenes
78496
```

Approximations:

```
>>> 5000.sieveOfEratosthenes
669

>>> 5000 / 5000.log
587.0478

>>> 5000.logarithmicIntegralRamanujan(99)
684.281
```

Plot the prime counting function:

~~~
1:999.collect(sieveOfEratosthenes:/1).plot
~~~

* * *

See also: isPrime, primesList

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PrimePi.html)
