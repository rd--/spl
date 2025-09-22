# randomPrime

- _randomPrime(r, iMin, iMax, shape)_

Answer random prime numbers between _iMin_ and _iMax_.

```
>>> Sfc32(47915)
>>> .randomPrime(1, 100, [])
31
```

A list of 10 pseudorandom primes less than 100:

```
>>> Sfc32(27314)
>>> .randomPrime(1, 100, [10])
[31 17 41 59 61 2 43 23 7 19]
```

If no prime exists in the specified range, an error is raised:

```
>>> {
>>> 	system.randomPrime(14, 16, [])
>>> }.hasError
true
```

* * *

See also: isPrime, nextPrime, randomInteger

Guides: Prime Number Functions, Random Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomPrime.html)
