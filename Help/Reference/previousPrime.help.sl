# previousPrime

- _previousPrime(n)_

Answer the greatest prime number less than the integer _n_.

Compute the last prime before 50:

```
>>> 50.previousPrime
47
```

The prime before 2,338,714:

```
>>> 2338714.previousPrime
2338703
```

If _n_ is prime, answer the prime with index one less:

```
>>> 1000.previousPrime
997

>>> 997.previousPrime
991

>>> (991.primePi, 997.primePi)
(167, 168)
```

Threads over lists,
OEIS [A007917](https://oeis.org/A007917):

```
>>> 3:23.previousPrime
[
	 2  3  3  5  5  7  7  7  7 11
	11 13 13 13 13 17 17 19 19 19
	19
]
```

* * *

See also: isPrime, nextPrime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PreviousPrime.html)
_OEIS_
[1](https://oeis.org/A007917)
