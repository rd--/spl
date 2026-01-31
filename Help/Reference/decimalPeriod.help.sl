# decimalPeriod

- _decimalPeriod(n/d)_

Answer the period of the decimal expansion of the `Fraction` _n/d_,
or `zero` if the expansion terminates.

```
>>> 1/3.decimalPeriod
1

>>> 1/11.decimalPeriod
2

>>> 1/37.decimalPeriod
3

>>> 1/101.decimalPeriod
4

>>> 1/41.decimalPeriod
5

>>> 1/7.decimalPeriod
6

>>> 1/73.decimalPeriod
8
```

Fractions with terminating decimal expansions:

```
>>> 1/1.decimalPeriod
0

>>> 1/2.decimalPeriod
0

>>> 1/5.decimalPeriod
0
```

First few terms,
OEIS [A051626](https://oeis.org/A051626):

```
>>> Fraction(1, 1:90)
>>> .collect(decimalPeriod:/1)
[
	 0  0  1  0  0  1  6  0  1 0
	 2  1  6  6  1  0 16  1 18 0
	 6  2 22  1  0  6  3  6 28 1
	15  0  2 16  6  1  3 18  6 0
	 5  6 21  2  1 22 46  1 42 0
	16  6 13  3  2  6 18 28 58 1
	60 15  6  0  6  2 33 16 22 6
	35  1  8  3  1 18  6  6 13 0
	 9  5 41  6 16 21 28  2 44 1
]
```

Cyclic numbers,
OEIS [A001913](https://oeis.org/A001913):

```
>>> [7 17 19 23 29 47 51 59 61 97]
>>> .collect { :d |
>>> 	Fraction(1, d).decimalPeriod
>>> }
[6 16 18 22 28 46 16 58 60 96]
```

Calculate decimal places of two cyclic numbers:

```
>>> Decimal(1/23, 22)
0.0434782608695652173913D

>> Decimal(1/97, 96)
0.0103092783505154639175257731958762
886597938144329896907216494845360824
74226804123711340206185567D
```

The decimal part may have a non-repeating prefix:

```
>>> 1/12.decimalPeriod
1

>>> 1 / 12
0.083333

>>> 1/18.decimalPeriod
1

>>> 1 / 18
0.05555

>>> 3227/555.decimalPeriod
3

>>> 1/24.decimalPeriod
1

>>> 1 / 24
0.041666

>>> Decimal(3227/555, 10)
5.8144144144D

>>> 1/555.decimalPeriod
3

>>> Decimal(1/555, 10)
0.0018018018D
```

Log scale plot of the period of the decimal representation of _1/n_,
OEIS [A051626](https://oeis.org/A051626):

~~~spl svg=A
Fraction(1, 1:200)
.collect(decimalPeriod:/1)
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/decimalPeriod-A.svg)

Period of decimal expansion of reciprocal of the _n_-th prime,
OEIS [A002371](https://oeis.org/A002371):

```
>>> 1:67.prime.collect { :p |
>>> 	(1 \ p).decimalPeriod
>>> }
[
	  0   1   0   6   2
	  6  16  18  22  28
	 15   3   5  21  46
	 13  58  60  33  35
	  8  13  41  44  96
	  4  34  53 108 112
	 42 130   8  46 148
	 75  78  81 166  43
	178 180  95 192  98
	 99  30 222 113 228
	232   7  30  50 256
	262 268   5  69  28
	141 146 153 155 312
	 79 110
]
```

Plot first few terms of
OEIS [A002371](https://oeis.org/A002371):

~~~spl svg=B
1:175.prime.collect { :p |
	(1 \ p).decimalPeriod
}.scatterPlot
~~~

![](sw/spl/Help/Image/decimalPeriod-B.svg)

* * *

See also: Fraction, isRepeatingDecimal, multiplicativeOrder

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RepeatingDecimal.html)
[2](https://mathworld.wolfram.com/DecimalPeriod.html),
_OEIS_
[1](https://oeis.org/A001913)
[2](https://oeis.org/A051626)
[3](https://oeis.org/A002371),
_W_
[1](https://en.wikipedia.org/wiki/Repeating_decimal)
