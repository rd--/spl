# decimalExpansion

- _decimalExpansion(n)_

Answer the decimal expansion of _n_,
also called decimal words or decimal vectors.

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

Replace _n_ with the concatenation of its prime divisors in increasing order,
OEIS [A048985](https://oeis.org/A048985),
also apart from first term
OEIS [A073646](https://oeis.org/A073646):

~~~spl svg=I
1:200.collect { :n |
	n.primeFactors
	.decimalExpansion
	.catenate
	.decimalContraction
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/decimalExpansion-A.svg)

* * *

See also: binaryExpansion, integerDigits
