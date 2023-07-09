# isPrime -- arithmetic

- _isPrime(anInteger)_

Determine if _anInteger_ is prime.

	23.isPrime = true
	(1 .. 99).select(isPrime:/1).size = 25
	(1 .. 999).select(isPrime:/1).size = 168
	(1 .. 9999).select(isPrime:/1).size = 1229
	(1 .. 99999).select(isPrime:/1).size = 9592

* * *

See also: nextPrime
