# integerReverse

- _integerReverse(n, b=10)_

Reverse the digits of an integer:

```
>>> 123456.integerReverse
654321
```

Reverse the binary digits of an integer:

```
>>> 2015.integerReverse(2)
2015

>>> 2015.integerDigits(2)
>>> .isPalindrome
true

>>> 2015.integerDigits(2)
[1 1 1 1 1 0 1 1 1 1 1]
```

Reverse the digits of an integer after padding it with zeroes on the left:

```
>>> 1234.integerReverse(10, 6)
432100
```

Threads over lists:

```
>>> [123 234 345 456].integerReverse
[321 432 543 654]
```

First few terms,
OEIS [A004086](https://oeis.org/A004086):

```
>>> 0:23.integerReverse
[
	0  1  2  3  4  5  6  7  8  9
	1 11 21 31 41 51 61 71 81 91
	2 12 22 32
]
```

Reversals of Fibonacci numbers (sorted),
OEIS [A004170](https://oeis.org/A004170):

```
>>> 0:20.fibonacci
>>> .integerReverse
>>> .sort
[
	   0    1    1    2    3
	   5    8   12   16   31
	  43   55   98  332  441
	 773  789 1814 4852 5676
	7951
]
```

Plot primes whose reversal in base ten is also prime,
sometimes called reversible primes,
OEIS [A007500](https://oeis.org/A007500):

~~~spl svg=A
1:600.prime.select { :n |
	n.integerReverse.isPrime
}.scatterPlot
~~~

![](sw/spl/Help/Image/integerReverse-A.svg)

Log scatter plot of the `gcd` of _n_ and the reverse of _n_,
OEIS [A055483](https://oeis.org/A055483):

~~~spl svg=B
1:120.collect { :n |
	gcd(n, n.integerReverse)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/integerReverse-B.svg)

Plot _R(Π(R(F(n))))_,
OEIS [A161594](https://oeis.org/A161594):

~~~spl svg=C
1:250.collect { :n |
	n.primeFactors
	.product(integerReverse:/1)
	.integerReverse
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/integerReverse-C.svg)

Plot _Π(R(F(n)))_,
OEIS [A071786](https://oeis.org/A071786):

~~~spl svg=D
1:250.collect { :n |
	n.primeFactors
	.product(integerReverse:/1)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/integerReverse-D.svg)

Plot first few terms,
OEIS [A004086](https://oeis.org/A004086):

~~~spl svg=E
0:400.integerReverse.linePlot
~~~

![](sw/spl/Help/Image/integerReverse-E.svg)

* * *

See also: bitReversalPermutation, fromDigits, integerDigits, integerLength, isPalindrome, reverse, vanDerCorputNumber

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Reversal.html)
[2](https://reference.wolfram.com/language/ref/IntegerReverse.html),
_OEIS_
[1](https://oeis.org/A004170)
