# sieveOfEratosthenes

- _sieveOfEratosthenes(n)_

Answer a `List` of the prime numbers less than or equal to the integer _n_ according to the sieve of Eratosthenes algorithm.

Prime numbers up to 99,
OEIS [A000040](https://oeis.org/A000040):

```
>>> 99.sieveOfEratosthenes
[
	 2  3  5  7 11 13 17 19 23 29
	31 37 41 43 47 53 59 61 67 71
	73 79 83 89 97
]
```

Prime numbers up to 999:

```
>>> 999.sieveOfEratosthenes
[
	  2   3   5   7  11
	 13  17  19  23  29
	 31  37  41  43  47
	 53  59  61  67  71
	 73  79  83  89  97
	101 103 107 109 113
	127 131 137 139 149
	151 157 163 167 173
	179 181 191 193 197
	199 211 223 227 229
	233 239 241 251 257
	263 269 271 277 281
	283 293 307 311 313
	317 331 337 347 349
	353 359 367 373 379
	383 389 397 401 409
	419 421 431 433 439
	443 449 457 461 463
	467 479 487 491 499
	503 509 521 523 541
	547 557 563 569 571
	577 587 593 599 601
	607 613 617 619 631
	641 643 647 653 659
	661 673 677 683 691
	701 709 719 727 733
	739 743 751 757 761
	769 773 787 797 809
	811 821 823 827 829
	839 853 857 859 863
	877 881 883 887 907
	911 919 929 937 941
	947 953 967 971 977
	983 991 997
]
```

Approximations:

```
>>> 5000.sieveOfEratosthenes.size
669

>>> 5000 / 5000.log
587.0478

>>> 5000.logarithmicIntegralRamanujan(99)
684.281
```

Plot the prime counting function:

~~~spl svg=A
1:99.functionPlot { :each |
	each.sieveOfEratosthenes.size
}
~~~

![](sw/spl/Help/Image/sieveOfEratosthenes-A.svg)

* * *

See also: isPrime, primesList, primePi, wheelSieve

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SieveofEratosthenes.html)
[2](https://reference.wolfram.com/language/ref/PrimePi.html),
_OEIS_
[1](https://oeis.org/A000040),
_W_
[1](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes)
