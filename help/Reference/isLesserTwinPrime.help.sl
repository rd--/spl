# isLesserTwinPrime

- _isLesserTwinPrime(anInteger)_

Answer `true` if _anInteger_ is the first (lesser) element of a twin prime pair.
Twin primes are pairs of primes of the form _(p, p + 2)_.

```
>>> 3:1607.select(isLesserTwinPrime:/1) + 1
[
	4 6 12 18 30 42 60 72
	102 108 138 150 180 192 198
	228 240 270 282
	312 348
	420 432 462
	522 570
	600 618 642 660
	810 822 828 858 882
	1020 1032 1050 1062 1092
	1152
	1230 1278 1290
	1302 1320
	1428 1452 1482 1488 1608
]
```

Plot:

~~~
3:1607.select(isLesserTwinPrime:/1).plot
~~~

* * *

See also: isPrime, nextPrime

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TwinPrimes.html),
_OEIS_
[1](https://oeis.org/A001359)
[2](https://oeis.org/A014574)
[3](https://oeis.org/A006512)
