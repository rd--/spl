# nthPrime -- math

- _nthPrime(anInteger)_

Answer the prime at index _anInteger_ in the sequence of prime numbers.

	5.nthPrime = 11
	3579.nthPrime = 33413

This value is cached (memoized) by the system,
so that subsequenct accesses do not require recalculation.

	system.cache::primesList[5] = 11
	system.cache::primesList[3579] = 33413

* * *

See also: isPrime, nextPrime, primesList, primesUpTo
