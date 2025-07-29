# isCarmichaelNumber

- _isCarmichaelNumber(n)_

Predicate to decide if _n_ is a Carmichael number.

There is one Carmichael less than one thousand:

```
>>> (501, 503 .. 599).select(isCarmichaelNumber:/1)
[561]
```

The first Carmichael numbers with four prime factors:

```
>>> 41041.isCarmichaelNumber
true

>>> 41041.primeFactors
[7 11 13 41]

>>> 62745.isCarmichaelNumber
true

>>> 62745.primeFactors
[3 5 47 89]
```

* * *

See also: carmichaelLambda

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CarmichaelNumber.html),
_OEIS_
[1](https://oeis.org/A002997),
_W_
[1](https://en.wikipedia.org/wiki/Carmichael_number)
