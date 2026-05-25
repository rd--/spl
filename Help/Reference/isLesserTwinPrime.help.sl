# isLesserTwinPrime

- _isLesserTwinPrime(n)_

Answer `true` if _n_ is the first (lesser) element of a twin prime pair.
Twin primes are pairs of primes of the form _(p,p+2)_.

```
>>> 137.isLesserTwinPrime
true

>>> (137 + 2).isPrime
true
```

Lesser of twin primes,
OEIS [A001359](https://oeis.org/A001359):

```
>>> 1:99.select(isLesserTwinPrime:/1)
[3 5 11 17 29 41 59 71]
```

Lesser twin primes are solutions to _φ(n+2)=σ(n)_:

```
>>> let n = [3 5 11 17 29 41 59 71];
>>> (n + 2).eulerPhi
1.divisorSigma(n)
```

Greater of twin primes,
OEIS [A006512](https://oeis.org/A006512):

```
>>> 1:99.select(isLesserTwinPrime:/1) + 2
[5 7 13 19 31 43 61 73]
```

Average of twin primes,
[A014574](https://oeis.org/A014574):

```
>>> 3:1607.select(
>>> 	isLesserTwinPrime:/1
>>> ) + 1
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

List of twin primes,
including duplicates,
OEIS [A077800](https://oeis.org/A077800):

```
>>> let a = 1:66.select(
>>> 	isLesserTwinPrime:/1
>>> );
>>> [a, a + 2].interleave
[3 5 5 7 11 13 17 19 29 31 41 43 59 61]
```

List of twin primes,
OEIS [A001097](https://oeis.org/A001097):

```
>>> let a = 1:66.select(
>>> 	isLesserTwinPrime:/1
>>> );
>>> [a, a + 2].interleave.deleteDuplicates
[3 5 7 11 13 17 19 29 31 41 43 59 61]
```

Sums of twin primes,
OEIS [A054735](https://oeis.org/A054735):

```
>>> 1:123.select(
>>> 	isLesserTwinPrime:/1
>>> ).collect { :n |
>>> 	n * 2 + 2
>>> }
[8 12 24 36 60 84 120 144 204 216]
```

Twin prime pairs concatenated in decimal representation,
OEIS [A095958](https://oeis.org/A095958):

```
>>> 1:123.select(
>>> 	isLesserTwinPrime:/1
>>> ).collect { :n |
>>> 	n.integerConcatenation(n + 2, 10)
>>> }
[
	35 57 1113 1719 2931
	4143 5961 7173 101103 107109
]
```

Decimal expansion of the twin prime constant,
OEIS [A005597](https://oeis.org/A005597):

```
>>> 'TwinPrimeConstant'
>>> .namedConstant(1, 32)
0.66016181584686957392781211001455D
```

Decimal expansion of twice the twin primes constant,
OEIS [A114907](https://oeis.org/A114907):

```
>>> 'TwinPrimeConstant'
>>> .namedConstant(2, 32)
1.32032363169373914785562422002911D
```

Continued fraction for twin prime constant,
OEIS [A065645](https://oeis.org/A065645):

```
>>> 'TwinPrimeConstant'
>>> .namedConstant
>>> .continuedFraction
[
	 0 1 1  1 16 2 2 2 2  1
	18 2 2 11  1 1 2 4 1 16
	 3 2 4 21
]
```

Numbers _m_ such that _6m-1_ and _6m+1_ are twin primes,
OEIS [A002822](https://oeis.org/A002822):

```
>>> 1:190.select { :n |
>>> 	(6 * n - 1).isLesserTwinPrime
>>> }
[
	  1   2   3   5   7
	 10  12  17  18  23
	 25  30  32  33  38
	 40  45  47  52  58
	 70  72  77  87  95
	100 103 107 110 135
	137 138 143 147 170
	172 175 177 182
]
```

Single, or isolated, or non-twin, primes,
OEIS [A007510](https://oeis.org/A007510):

```
>>> 1:100.prime.select { :p |
>>> 	(p - 2).isPrime.not & {
>>> 		(p + 2).isPrime.not
>>> 	}
>>> }
[
	  2  23  37  47  53
	 67  79  83  89  97
	113 127 131 157 163
	167 173 211 223 233
	251 257 263 277 293
	307 317 331 337 353
	359 367 373 379 383
	389 397 401 409 439
	443 449 457 467 479
	487 491 499 503 509
	541
]
```

Lesser of twin primes,
OEIS [A001359](https://oeis.org/A001359):

~~~spl svg=A oeis=A001359
3:1607
.select(isLesserTwinPrime:/1)
.linePlot
~~~

![](Help/Image/isLesserTwinPrime-A.svg)

List of twin primes,
OEIS [A001097](https://oeis.org/A001097):

~~~spl svg=B oeis=A001097
let a = 3:1607.select(
	isLesserTwinPrime:/1
);
[a, a + 2]
.interleave
.deleteDuplicates
.discretePlot
~~~

![](Help/Image/isLesserTwinPrime-B.svg)

List of twin primes modulo four,
OEIS [A122567](https://oeis.org/A122567):

~~~spl svg=C oeis=A122567
let a = 3:1019.select(
	isLesserTwinPrime:/1
);
let b = [a, a + 2].interleave;
let c = b.deleteDuplicates;
(c % 4).stepPlot
~~~

![](Help/Image/isLesserTwinPrime-C.svg)

* * *

See also: isPrime, nextPrime

Guides: Integer Sequence Functions, Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TwinPrimes.html),
_OEIS_
[1](https://oeis.org/A001359)
[2](https://oeis.org/A014574)
[3](https://oeis.org/A006512),
_W_
[1](https://en.wikipedia.org/wiki/Twin_prime)

Categories: Testing
