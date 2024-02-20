# randomPrime

- _randomPrime(iMin, iMax)_
- _randomPrime(iMin, iMax, count)_

Answer random prime numbers between _iMin_ and _iMax_.

```
>>> 1.randomPrime(100).isPrime
true
```

A list of 10 pseudorandom primes less than 100:

```
>>> 1.randomPrime(100, 10).allSatisfy(isPrime:/1)
true
```

If no prime exists in the specified range, an error is raised:

```
>>> { 14.randomPrime(16) }.ifError { true }
true
```

See also: isPrime, nextPrime, randomInteger

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomPrime.html)
