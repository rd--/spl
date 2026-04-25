# decimalExpansion

- _decimalExpansion(n)_
- _decimalExpansion(n/d, k)_

Answer the decimal expansion of the integer _n_,
also called decimal words or decimal vectors,
or the first _k_ places of the decimal expansion of the fraction _n/d_.

```
>>> 353.decimalExpansion
[3 5 3]

>>> 353.integerDigits(10)
[3 5 3]
```

The inverse is `decimalContraction`:

```
>>> [353].decimalContraction
353

>>> [353].fromDigits(10)
353
```

Threads over lists,
first few terms,
OEIS [A007376](https://oeis.org/A007376):

```
>>> 0:15.decimalExpansion
[
	0; 1; 2; 3; 4; 5; 6; 7; 8; 9;
	1 0; 1 1; 1 2; 1 3; 1 4; 1 5
]
```

Home primes,
OEIS [A037274](https://oeis.org/A037274),
primes are trivially themselves,
and eight is 3331113965338635107,
count also the number of steps,
OEIS [A037271](https://oeis.org/A037271):

```
>>> [4 6 9 10 12 14 15 16 18].collect { :n |
>>> 	let y = { :x |
>>> 		x.primeFactors
>>> 		.decimalExpansion
>>> 		.catenate
>>> 		.decimalContraction
>>> 	}.nestWhileList(n) { :x |
>>> 		x.isPrime.not
>>> 	};
>>> 	n -> (y.last, y.size - 1)
>>> }
[
	4 -> (211, 2),
	6 -> (23, 1),
	9 -> (311, 2),
	10 -> (773, 4),
	12 -> (223, 1),
	14 -> (13367, 5),
	15 -> (1129, 4),
	16 -> (31636373, 4),
	18 -> (233, 1)
]
```

Numbers with no trailing zeros in decimal representation,
OEIS [A067251](https://oeis.org/A067251):

```
>>> 0:20.reject { :n |
>>> 	n.decimalExpansion.last.isZero
>>> }
[
	 1  2  3  4  5  6  7  8  9
	11 12 13 14 15 16 17 18 19
]
```

Replace _n_ with the concatenation of its prime divisors in increasing order,
OEIS [A048985](https://oeis.org/A048985),
also apart from first term
OEIS [A073646](https://oeis.org/A073646):

~~~spl svg=A oeis=A073646
2:200.collect { :n |
	n.primeFactors
	.decimalExpansion
	.catenate
	.decimalContraction
}.scatterPlot.log
~~~

![](Help/Image/decimalExpansion-A.svg)

Initial digit of _n_,
OEIS [A000030](https://oeis.org/A000030):

~~~spl svg=B oeis=A000030
0:100.collect { :n |
	n.decimalExpansion.first
}.stepPlot
~~~

![](Help/Image/decimalExpansion-B.svg)

Decimal expansion of _1/607_,
OEIS [A021611](https://oeis.org/A021611):

~~~spl svg=C oeis=A021611
1/607.decimalExpansion(85)
.discretePlot
~~~

![](Help/Image/decimalExpansion-C.svg)

The product of the cubes of the nonzero digits of _n_,
OEIS [A352172](https://oeis.org/A352172):

~~~spl svg=D oeis=A352172
0:215.collect { :n |
	n.decimalExpansion
	.select(isPositive:/1)
	.product ^ 3
}.scatterPlot.log
~~~

![](Help/Image/decimalExpansion-D.svg)

The product of the nonzero digits of _n_,
OEIS [A051801](https://oeis.org/A051801):

~~~spl svg=E oeis=A051801
0:215.collect { :n |
	n.decimalExpansion
	.select(isPositive:/1)
	.product
}.scatterPlot
~~~

![](Help/Image/decimalExpansion-E.svg)

Matrix plot of the magic square given by the multiples of _1/19_:

~~~spl svg=F
1:18.collect { :n |
	Fraction(n, 19)
	.decimalExpansion(18)
}.matrixPlot
~~~

![](Help/Image/decimalExpansion-F.svg)

Matrix plot of the magic square given by the reordered multiples of _1/17_:

~~~spl svg=G
[1 5 8 6 13 14 2 10 16 12 9 11 4 3 15 7]
.collect { :n |
	Fraction(n, 17)
	.decimalExpansion(16)
}.matrixPlot
~~~

![](Help/Image/decimalExpansion-G.svg)

* * *

See also: binaryExpansion, integerDigits
