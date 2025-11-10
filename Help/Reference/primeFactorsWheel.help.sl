# primeFactorsWheel

- _primeFactorsWheel(n)_

Answer the prime factors of the integer _n_ as given by a _wheel_ algorithm.

Prime factors of the first seventeen integers:

```
>>> 1:17.collect(
>>> 	primeFactorsWheel:/1
>>> )
[
	;
	2;
	3;
	2 2;
	5;
	2 3;
	7;
	2 2 2;
	3 3;
	2 5;
	11;
	2 2 3;
	13;
	2 7;
	3 5;
	2 2 2 2;
	17
]
```

Prime factors of specific values:

```
>>> 30.primeFactorsWheel
[2 3 5]

>>> 60.primeFactorsWheel
[2 2 3 5]

>>> 138.primeFactorsWheel
[2 3 23]

>>> 200.primeFactorsWheel
[2 2 2 5 5]

>>> 231.primeFactorsWheel
[3 7 11]

>>> 315.primeFactorsWheel
[3 3 5 7]

>>> 8589298611.primeFactorsWheel
[3 2863099537]

>>> (2 ^ 31).primeFactors
31 # [2]

>>> (2 ^ 31 + 1).primeFactorsWheel
[3 715827883]

>>> (2 ^ 31 + 2).primeFactorsWheel
[2 5 5 13 41 61 1321]

>>> (2 ^ [43 47 53] - 1).collect(
>>> 	primeFactorsWheel:/1
>>> )
[
	431 9719 2099863;
	2351 4513 13264529;
	6361 69431 20394401
]
```

* * *

See also: isPrime, primeFactors, primeFactorsTrialDivision

Guides: Prime Number Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Wheel_factorization)

Categories: Math
