# isPrime

- _isPrime(n)_

Determine if the integer _n_ is prime.

```
>>> 23.isPrime
true

>>> (11.factorial + 1).isPrime
true
```

Primes up to one hundred:

```
>>> 1:99.select(isPrime:/1)
[
	 2  3  5  7 11 13 17 19 23 29
	31 37 41 43 47 53 59 61 67 71
	73 79 83 89 97
]
```

Non-primes up to thirty:

```
>>> 1:30.reject(isPrime:/1)
[
	 1  4  6  8  9 10 12 14 15 16
	18 20 21 22 24 25 26 27 28 30
]
```

Number of primes up to one-thousand:

```
>>> 1:999.select(isPrime:/1).size
168
```

Select primes:

```
>>> (1 .. 131).select(isPrime:/1)
[
	  2   3   5   7  11
	 13  17  19  23  29
	 31  37  41  43  47
	 53  59  61  67  71
	 73  79  83  89  97
	101 103 107 109 113
	127 131
]

>>> (827 .. 999).select(isPrime:/1)
[
	827 829 839 853 857
	859 863 877 881 883
	887 907 911 919 929
	937 941 947 953 967
	971 977 983 991 997
]
```

Number of primes up to ten-thousand:

```
>>> 1:9999.count(isPrime:/1)
1229
```

Test for large integers:

```
>>> 3L.isPrime
true

>>> (10L ^ 3000 + 1).isPrime
false
```

Threads over lists:

```
>>> 1:6.isPrime
[false true true false true false]

>>> [2 3 0 6 10].isPrime.boole
[1 1 0 0 0]

>>> 0:24.isPrime.boole
[
	0 0 1 1 0 1 0 1 0 0
	0 1 0 1 0 0 0 1 0 1
	0 0 0 1 0
]
```

Recognize Fermat primes, prime numbers of the form _2 ^ 2 ^ n + 1_:

```
>>> (2 ^ (2 ^ 3) + 1).isPrime
true
```

The number _2 ^ 2 ^ 7 + 1_ is not a Fermat prime, & requires _millerRabinPrimalityTest_:

```
>>> let n = (2L ^ (2 ^ 7) + 1);
>>> n.millerRabinPrimalityTest(10)
false
```

Recognize Wieferich primes, prime numbers _p_ such that _p^2_ divides _2^(p-1)-1_:

```
>>> let f = { :n |
>>> 	n.isPrime & {
>>> 		let a = 2 ^ (n - 1) - 1;
>>> 		let b = n ^ 2;
>>> 		a % b = 0
>>> 	}
>>> };
>>> (1L .. 9999L).select(f:/1)
[1093L, 3511L]
```

Find twin primes:

```
>>> 1:333.select { :i |
>>> 	i.isPrime & {
>>> 		i.nextPrime = (i + 2)
>>> 	}
>>> }
[
	  3   5  11  17  29
	 41  59  71 101 107
	137 149 179 191 197
	227 239 269 281 311
]
```

At `zero` and `one`:

```
>>> [0 1].isPrime
[false false]
```

Eulers prime-generating polynomial,
OEIS [A005846](https://oeis.org/A005846):

```
>>> let e = 0:23.collect { :n |
>>> 	(n ^ 2) + n + 41
>>> };
>>> (e.allSatisfy(isPrime:/1), e)
(
	true,
	[
		 41  43  47  53  61
		 71  83  97 113 131
		151 173 197 223 251
		281 313 347 383 421
		461 503 547 593
	]
)
```

Safe primes,
OEIS [A005385](https://oeis.org/A005385):

```
>>> 2:400.prime.select { :p |
>>> 	((p - 1) / 2).isPrime
>>> }
[
	   5    7   11   23   47
	  59   83  107  167  179
	 227  263  347  359  383
	 467  479  503  563  587
	 719  839  863  887  983
	1019 1187 1283 1307 1319
	1367 1439 1487 1523 1619
	1823 1907 2027 2039 2063
	2099 2207 2447 2459 2579
]
```

Sophie Germain primes,
OEIS [A005384](https://oeis.org/A005384):

```
>>> 1:200.prime.select { :p |
>>> 	((2 * p) + 1).isPrime
>>> }
[
	   2    3    5   11   23
	  29   41   53   83   89
	 113  131  173  179  191
	 233  239  251  281  293
	 359  419  431  443  491
	 509  593  641  653  659
	 683  719  743  761  809
	 911  953 1013 1019 1031
	1049 1103 1223
]
```

Primes _p_ where _1/p_ has a decimal period of _p-1_,
the maximum-possible cycle length,
OEIS [A000353](https://oeis.org/A000353):

```
>>> 1:900.prime.select { :p |
>>> 	[7 19 23].includes(p % 40) & {
>>> 		((p - 1) / 2).isPrime
>>> 	}
>>> }
[
	   7   23   47   59  167
	 179  263  383  503  863
	 887  983 1019 1367 1487
	1619 1823 2063 2099 2207
	2447 2459 2579 2819 2903
	3023 3167 3623 3779 3863
	4007 4127 4139 4259 4703
	5087 5099 5807 5927 5939
	6047 6659 6779 6899 6983
]

>>> 1/47.decimalPeriod
46

>>> 1/383.decimalPeriod
382
```

The de Polignac numbers,
OEIS [A006285](https://oeis.org/A006285):


```
>>> (5, 7 .. 701).select { :n |
>>> 	let m = 2 ^ (1 .. n.log(2).floor);
>>> 	(n - m).isPrime.allFalse
>>> }
[127 149 251 331 337 373 509 599 701]
```

Plot primes up to one-thousand:

~~~spl svg=A
1:999.select(isPrime:/1).linePlot
~~~

![](sw/spl/Help/Image/isPrime-A.svg)

* * *

See also: isComposite, isGaussianPrime, isPrimePower, isPrimeTrialDivision, isSemiprime, isSternPrime, millerRabinPrimalityTest, nextPrime, prime, primesList

Guides: Integer Functions, Mathematical Functions, Prime Number Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/pco#dyadic),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=isprime),
_Mathematica_
[1](https://mathworld.wolfram.com/Primes.html)
[2](https://reference.wolfram.com/language/ref/PrimeQ.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/isprime.html),
_OEIS_
[1](https://oeis.org/A005846)
[2](https://oeis.org/A005385)
[3](https://oeis.org/A005384)
[4](https://oeis.org/A000353)
[5](https://oeis.org/A006285),
_W_
[1](https://en.wikipedia.org/wiki/Primality_test)
[2](https://en.wikipedia.org/wiki/Safe_and_Sophie_Germain_primes)

Categories: Arithmetic
