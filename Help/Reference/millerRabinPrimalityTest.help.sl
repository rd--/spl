# millerRabinPrimalityTest

- _millerRabinPrimalityTest(n, k)_

A primality test that provides an efficient probabilistic algorithm for determining if a given number, _n_, is prime.
It is based on the properties of strong pseudoprimes.

At `SmallFloat`:

```
>>> (1 .. 30).select { :n |
>>> 	n.millerRabinPrimalityTest(10)
>>> }
[2 3 5 7 11 13 17 19 23 29]
```

At `LargeInteger`:

```
>>> (1L .. 131L).select { :n |
>>> 	n.millerRabinPrimalityTest(10)
>>> }
[
	  2   3   5   7  11
	 13  17  19  23  29
	 31  37  41  43  47
	 53  59  61  67  71
	 73  79  83  89  97
	101 103 107 109 113
	127 131
]

>>> (827L .. 999L).select { :n |
>>> 	n.millerRabinPrimalityTest(10)
>>> }
[
	827 829 839 853 857
	859 863 877 881 883
	887 907 911 919 929
	937 941 947 953 967
	971 977 983 991 997
]
```

The number _2 ^ 2 ^ 7 + 1_ is not a Fermat prime, & requires `millerRabinPrimalityTest`:

```
>>> let n = (2L ^ (2 ^ 7) + 1);
>>> (n, n.millerRabinPrimalityTest(10))
(
	340282366920938463463374607431768211457L,
	false
)
```

* * *

See also: isPrime, isPrimeTrialDivision

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Rabin-MillerStrongPseudoprimeTest.html),
_W_
[1](https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test)

Categories: Testing
