# millerRabinPrimalityTest

- _millerRabinPrimalityTest(anInteger, k)_

A primality test that provides an efficient probabilistic algorithm for determining if a given number is prime.
It is based on the properties of strong pseudoprimes.

At `SmallFloat`:

```
>>> (1 .. 30).select { :each | each.millerRabinPrimalityTest(10) }
[2 3 5 7 11 13 17 19 23 29]
```

At `LargeInteger`:

```
>>> (1n .. 131n).select { :each | each.millerRabinPrimalityTest(10) }
[
	  2   3   5   7  11  13  17  19  23  29
	 31  37  41  43  47  53  59  61  67  71
	 73  79  83  89  97 101 103 107 109 113
	127 131
]

>>> (827n .. 999n).select { :each | each.millerRabinPrimalityTest(10) }
[
	827 829 839 853 857 859 863 877 881 883
	887 907 911 919 929 937 941 947 953 967
	971 977 983 991 997
]
```

The number _2 ^ 2 ^ 7 + 1_ is not a Fermat prime, & requires `millerRabinPrimalityTest:

```
>>> let n = (2n ^ (2 ^ 7) + 1);
>>> (n, n.millerRabinPrimalityTest(10))
(340282366920938463463374607431768211457n, false)
```

* * *

See also: isPrime

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Rabin-MillerStrongPseudoprimeTest.html)
