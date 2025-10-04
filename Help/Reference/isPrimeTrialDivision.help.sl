# isPrimeTrialDivision

- _isPrimeTrialDivision(n)_

Answer `true` if the integer _n_ is a prime number, according to the trial division algorithm.

Select the prime numbers up to one hundred:

```
>>> (1L .. 99L).select(
>>> 	isPrimeTrialDivision:/1
>>> )
[
	2 3 5 7 11 13 17 19 23 29
	31 37 41 43 47 53 59 61 67 71
	73 79 83 89 97
]
```

Validate using `isPrime`:

```
>>> 1:99.select(isPrime:/1)
[
	2 3 5 7 11 13 17 19 23 29
	31 37 41 43 47 53 59 61 67 71
	73 79 83 89 97
]
```

Number of primes up to ten-thousand:

```
>>> 1:9999.select(
>>> 	isPrimeTrialDivision:/1
>>> ).size
1229
```

For large integers the test can be very slow:

~~~spl timing
{
	304250263527281L
	.isPrimeTrialDivision
}.timing
~~~


See also: isPrime, millerRabinPrimalityTest, primeFactorsTrialDivision

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TrialDivision.html),
_W_
[1](https://en.wikipedia.org/wiki/Trial_division)

Categories: Testing
