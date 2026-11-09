# isLucasCarmichaelNumber

- _isLucasCarmichaelNumber(n)_

Answer `true` if _n_ is a Lucas-Carmichael number,
else `false`.

First few Lucas-Carmichael numbers:

```
>>> [2 .. 3000].select(
>>> 	isLucasCarmichaelNumber/1
>>> )
[399 935 2015 2915]

>>> 399.factorInteger
[3 1; 7 1; 19 1]

>>> (399 + 1).divisible([3 7 19] + 1)
[true true true]

>>> 588455.isLucasCarmichaelNumber
true
```

First few Lucas-Carmichael numbers,
OEIS [A006972](https://oeis.org/A006972):

```
>>> [
>>> 	399 935 2015 2915 4991
>>> 	5719 7055 8855 12719 18095
>>> 	20705 20999 22847 29315 31535
>>> 	46079 51359 60059 63503 67199
>>> 	73535 76751 80189 81719 88559
>>> 	90287 104663 117215 120581 147455
>>> 	152279 155819 162687 191807 194327
>>> 	196559 214199
>>> ].allTrue(isLucasCarmichaelNumber/1)
true
```

* * *

See also: factorInteger, isCarmichaelNumber, isPrime, mod

Guides: Integer Functions, Mathematical Functions, Prime Number Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Lucas%E2%80%93Carmichael_number)
