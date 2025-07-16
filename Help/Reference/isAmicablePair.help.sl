# isAmicablePair

- _isAmicablePair([m, n])_

Answer `true` if the integers _m_ and _n_ form an amicable pair, and `false` otherwise.

The smallest pair of amicable numbers:

```
>>> [220 284].isAmicablePair
true

>>> 220.divisors.sum - 220
284

>>> 284.divisors.sum - 284
220
```

The first few amicable pairs:

```
>>> [
>>> 	220 284;
>>> 	1184 1210;
>>> 	2620 2924;
>>> 	5020 5564;
>>> 	6232 6368;
>>> 	10744 10856;
>>> 	12285 14595;
>>> 	17296 18416
>>> ].collect { :each |
>>> 	each.isAmicablePair
>>> }
[true true true true true true true true]
```

* * *

See also: divisors, sum

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WeirdNumber.html),
_OEIS_
[1](https://oeis.org/A259180)
_W_
[1](https://en.wikipedia.org/wiki/Amicable_numbers)
