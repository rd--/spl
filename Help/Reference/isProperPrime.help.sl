# isProperPrime

- _isProperPrime(n)_

Predicate to decide if _n_ is a full reptend prime and congruent to `one` `mod` ten.

First few terms,
OEIS [A073761](https://oeis.org/A073761):

```
>>> 1:600.select(isProperPrime:/1)
[61 131 181 461 491 541 571]
```

The decimal expansion of _1/n_ is equidistributed in base ten:

```
>>> 1/61.decimalPeriod
60

>>> Decimal(1/61, 60)
>>> .integerDigits
>>> .sort
6 # [0 .. 9]

>>> 1/131.decimalPeriod
130

>>> Decimal(1/131, 130)
>>> .integerDigits
>>> .sort
13 # [0 .. 9]
```

* * *

See also: isFullReptendPrime, isPrime, mod

Guides: Prime Number Functions

References:
_OEIS_
[1](https://oeis.org/A073761)

Further Reading: Dickson 1952
