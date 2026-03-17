# isLesserTwinPrime

- _isLesserTwinPrime(n)_

Answer `true` if _n_ is the first (lesser) element of a twin prime pair.
Twin primes are pairs of primes of the form _(p, p + 2)_.

```
>>> (137.isLesserTwinPrime, 139.isPrime)
(true, true)
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
[35 57 1113 1719 2931 4143 5961 7173 101103 107109]
```

Lesser of twin primes,
OEIS [A001359](https://oeis.org/A001359):

~~~spl svg=A oeis=A001359
3:1607
.select(isLesserTwinPrime:/1)
.linePlot
~~~

![](sw/spl/Help/Image/isLesserTwinPrime-A.svg)

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

![](sw/spl/Help/Image/isLesserTwinPrime-B.svg)

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

![](sw/spl/Help/Image/isLesserTwinPrime-C.svg)

* * *

See also: isPrime, nextPrime

Guides: Integer Sequence Functions, Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TwinPrimes.html),
_OEIS_
[1](https://oeis.org/A001359)
[2](https://oeis.org/A014574)
[3](https://oeis.org/A006512)

Categories: Testing
