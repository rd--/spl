# primeFactorsTrialDivision

- _primeFactorsTrialDivision(anInteger)_

Answer the prime factors of _anInteger_ as given by the _trial division_ algorithm.

Prime factors of the first seventeen integers:

```
>>> 1:17.collect(primeFactorsTrialDivision:/1)
[
	; 2; 3; 2 2; 5; 2 3; 7; 2 2 2; 3 3; 2 5;
	11; 2 2 3; 13; 2 7; 3 5; 2 2 2 2; 17
]
```

Prime factors of specific values:

```
>>> (2 ^ [43 47 53] - 1).collect(
>>> 	primeFactorsTrialDivision:/1
>>> )
[
	431 9719 2099863;
	2351 4513 13264529;
	6361 69431 20394401
]
```

* * *

See also: isPrime, primeFactors

References:
_W_
[1](https://en.wikipedia.org/wiki/Trial_division)

Categories: Math
