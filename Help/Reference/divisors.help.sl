# divisors

- _divisors(n)_

Answers the `List` of integers that are divisors of the integer _n_.
For all positive integers, `divisors` includes `one` and _n_ as the first and last entries.

Divisors of 30:

```
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

* * *

See also: divisorSigma, divisorSum, gcd, remainder

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Divisor.html)
[2](http://reference.wolfram.com/language/ref/Divisors.html),
_W_
[1](https://en.wikipedia.org/wiki/Table_of_divisors)

Categories: Arithmetic
