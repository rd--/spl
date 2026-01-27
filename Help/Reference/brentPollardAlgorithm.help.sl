# brentPollardAlgorithm

- _brentPollardAlgorithm(n)_

Implement the Brent-Pollard algorithm to factor the integer _n_.

At `LargeInteger`:

```
>>> (2L ^ 64 - 585).brentPollardAlgorithm
9094863431L

>>> (2L ^ 64 - 585) / 9094863431L
2028259601L

>>> 9094863431L * 2028259601L
18446744073709551031L
```

Confirm using `factorInteger` or `divisors`:

```
>>> 10403L.brentPollardAlgorithm
101L

>>> 10403L / 101L
103L

>>> 10403L.factorInteger
[101 1; 103 1]

>>> 10403L.divisors
[1 101 103 10403]
```

* * *

See also: divisors, factorInteger

Guides: Integer Functions, Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PollardRhoFactorizationMethod.html)
[2](https://mathworld.wolfram.com/BrentsFactorizationMethod.html),
_W_
[1](https://en.wikipedia.org/wiki/Pollard%27s_rho_algorithm)
