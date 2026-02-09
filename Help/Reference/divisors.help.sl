# divisors

- _divisors(n)_

Answers the `List` of integers that are divisors of the integer _n_.
For all positive integers, `divisors` includes `one` and _n_ as the first and last entries.

Divisors of 24 and 30:

```
>>> 24.divisors
[1 2 3 4 6 8 12 24]

>>> 30.divisors
[1 2 3 5 6 10 15 30]
```

Divisors of 60:

```
>>> 60.divisors
[1 2 3 4 5 6 10 12 15 20 30 60]
```

Written out:

```
>>> [
>>> 	1,
>>> 	2, 2 * 2,
>>> 	3, 3 * 2, 3 * 2 * 2,
>>> 	5, 5 * 2, 5 * 2 * 2,
>>> 	5 * 3, 5 * 3 * 2, 5 * 3 * 2 * 2
>>> ].sort
60.divisors
```

Divisors of 1729:

```
>>> 1729.divisors
[1 7 13 19 91 133 247 1729]
```

1729 divided by its divisors:

```
>>> 1729 / [1 7 13 19 91 133 247 1729]
[1729 247 133 91 19 13 7 1]
```

Divisors of 5040, seven factorial,
which is the eighth superior highly composite and colossally abundant number,
the nineteenth highly composite number:

```
>>> 5040.divisors
[
	   1    2    3    4    5
	   6    7    8    9   10
	  12   14   15   16   18
	  20   21   24   28   30
	  35   36   40   42   45
	  48   56   60   63   70
	  72   80   84   90  105
	 112  120  126  140  144
	 168  180  210  240  252
	 280  315  336  360  420
	 504  560  630  720  840
	1008 1260 1680 2520 5040
]
```

For integer input, integer divisors are returned:

```
>>> 6.divisors
[1 2 3 6]
```

Divisors threads element-wise over list arguments:

```
>>> [605 871 824].divisors
[
	1 5 11 55 121 605;
	1 13 67 871;
	1 2 4 8 103 206 412 824
]

>>> [12 28 45 53 64].divisors
[
	1 2 3 4 6 12;
	1 2 4 7 14 28;
	1 3 5 9 15 45;
	1 53;
	1 2 4 8 16 32 64
]
```

Divisor sets for all regular (5-smooth) numbers less than one hundred:

```
>>> 1:100.select { :each |
>>> 	each.isSmoothNumber(5)
>>> }.divisors
[
	1;
	1 2;
	1 3;
	1 2 4;
	1 5;
	1 2 3 6;
	1 2 4 8;
	1 3 9;
	1 2 5 10;
	1 2 3 4 6 12;
	1 3 5 15;
	1 2 4 8 16;
	1 2 3 6 9 18;
	1 2 4 5 10 20;
	1 2 3 4 6 8 12 24;
	1 5 25;
	1 3 9 27;
	1 2 3 5 6 10 15 30;
	1 2 4 8 16 32;
	1 2 3 4 6 9 12 18 36;
	1 2 4 5 8 10 20 40;
	1 3 5 9 15 45;
	1 2 3 4 6 8 12 16 24 48;
	1 2 5 10 25 50;
	1 2 3 6 9 18 27 54;
	1 2 3 4 5 6 10 12 15 20 30 60;
	1 2 4 8 16 32 64;
	1 2 3 4 6 8 9 12 18 24 36 72;
	1 3 5 15 25 75;
	1 2 4 5 8 10 16 20 40 80;
	1 3 9 27 81;
	1 2 3 5 6 9 10 15 18 30 45 90;
	1 2 3 4 6 8 12 16 24 32 48 96;
	1 2 4 5 10 20 25 50 100
]
```

Find all perfect numbers less than 500:

```
>>> 1:499.select { :each |
>>> 	each.divisors.sum = (2 * each)
>>> }
[6 28 496]
```

Orderly numbers,
OEIS [A167408](https://oeis.org/A167408):

```
>>> 1:99.select { :n |
>>> 	let d = n.divisors;
>>> 	let t = d.size;
>>> 	let u = [1 .. t];
>>> 	let k = 3;
>>> 	let m = (t + 4).max(d.last - 2);
>>> 	{
>>> 		k <= m & {
>>> 			(d % k).nub.sort != u
>>> 		}
>>> 	}.whileTrue {
>>> 		k := k + 1
>>> 	};
>>> 	k <= m
>>> }
[
	 1  2  5  7  8  9 11 12 13 17
	19 20 23 27 29 31 37 38 41 43
	47 52 53 57 58 59 61 67 68 71
	72 73 76 79 83 87 89 97
]
```

A logarithmic plot of `divisors` of the diatonic number 8640,
showing the sigmoid shape typical of divisor sets:

~~~spl svg=A
8640.divisors.log2.linePlot
~~~

![](sw/spl/Help/Image/divisors-A.svg)

At higher resolution (ie. the divisor set of a moderately large integer):

~~~spl svg=B
345600.divisors.log2.linePlot
~~~

![](sw/spl/Help/Image/divisors-B.svg)

A logarithmic plot of the intervals between consecutive divisors:

~~~spl svg=C
8640.divisors.log2.differences.linePlot
~~~

![](sw/spl/Help/Image/divisors-C.svg)

Array read by rows in which row _n_ lists the divisors of _n_ that are _≥√n_,
OEIS [A161908](https://oeis.org/A161908):

~~~spl svg=D
1:100.collect { :n |
	n.divisors.select { :m |
		m >= n.sqrt
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/divisors-D.svg)

Sum of the nonprime divisors of _n_,
OEIS [A023890](https://oeis.org/A023890):

~~~spl svg=E
1:275.collect { :n |
	n.divisors.reject(isPrime:/1).sum
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisors-E.svg)

Plot largest divisor of _n_,
_≤√n_,
OEIS [A033676](https://oeis.org/A033676):

~~~spl svg=F
1:100.collect { :n |
	let m = n.sqrt;
	n.divisors.select { :x |
		x <= m
	}.last
}.stepPlot
~~~

![](sw/spl/Help/Image/divisors-F.svg)

Plot number of odd divisors of _n_,
OEIS [A001227](https://oeis.org/A001227):

~~~spl svg=G
1:105.collect { :n |
	(n.divisors % 2).sum
}.stepPlot
~~~

![](sw/spl/Help/Image/divisors-G.svg)

Plot number of torus knots with _n_ crossings,
OEIS [A051764](https://oeis.org/A051764):

~~~spl svg=H
1:75.collect { :n |
	let t = n.integerSquareRoot;
	n.divisors.count { :k |
		k > t & {
			k.gcd(n / k + 1) = 1
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/divisors-H.svg)

* * *

See also: divisorSigma, divisorSum, gcd, remainder

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Divisor.html)
[2](http://reference.wolfram.com/language/ref/Divisors.html),
_OEIS_
[1](https://oeis.org/A167408)
[2](https://oeis.org/A161908)
[3](https://oeis.org/A023890),
_Python_
[1](https://docs.sympy.org/latest/modules/ntheory.html#sympy.ntheory.factor_.divisors),
_W_
[1](https://en.wikipedia.org/wiki/Table_of_divisors)

Categories: Arithmetic
