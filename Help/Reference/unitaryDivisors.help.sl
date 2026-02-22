# unitaryDivisors

- _unitaryDivisors(n)_

Answer the unitary divisors of the integer _n_.

```
>>> 12.unitaryDivisors
[1 3 4 12]

>>> 120.unitaryDivisors
[1 3 5 8 15 24 40 120]
```

The first few terms,
OEIS [A077610](https://oeis.org/A077610):

```
>>> 1:15.collect(unitaryDivisors:/1)
[
	1;
	1 2;
	1 3;
	1 4;
	1 5;
	1 2 3 6;
	1 7;
	1 8;
	1 9;
	1 2 5 10;
	1 11;
	1 3 4 12;
	1 13;
	1 2 7 14;
	1 3 5 15
]
```

Sum of unitary divisors of n is a square,
OEIS [A063937](https://oeis.org/A063937):

```
>>> 2:200.select { :n |
>>> 	let m = n.unitaryDivisors.sum;
>>> 	m.sqrt.isInteger
>>> }
[
	  3   8  22  24  66
	 70  76  94 115 119
	170
]
```

Unitary harmonic numbers,
_n_ for which the unitary harmonic mean is an integer,
OEIS [A006086](https://oeis.org/A006086):

```
>>> 1L:650.select { :n |
>>> 	n.unitaryDivisors
>>> 	.harmonicMean
>>> 	.isInteger
>>> }
[1 6 45 60 90 420 630]
```

Unitary harmonic means of the unitary harmonic numbers,
OEIS [A006087](https://oeis.org/A006087):

```
>>> [1 6 45 60 90 420 630 1512 3780 5460]
>>> .collect { :n |
>>> 	n.unitaryDivisors
>>> 	.harmonicMean
>>> }
[1 2 3 4 4 7 7 6 9 13]
```

Plot first few terms,
OEIS [A077610](https://oeis.org/A077610):

~~~spl svg=A
1:65.collect(unitaryDivisors:/1)
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/unitaryDivisors-A.svg)

Plot harmonic mean of unitary divisors:

~~~spl svg=B
1:150.collect { :n |
	n.unitaryDivisors.harmonicMean
}.scatterPlot
~~~

![](sw/spl/Help/Image/unitaryDivisors-B.svg)

Numerators of the unitary harmonic means,
OEIS [A103339](https://oeis.org/A103339):

~~~spl svg=C
1L:65.collect { :n |
	n.unitaryDivisors.harmonicMean
}.numerator.discretePlot
~~~

![](sw/spl/Help/Image/unitaryDivisors-C.svg)

Denominators of the unitary harmonic means,
OEIS [A103340](https://oeis.org/A103340):

~~~spl svg=D
1L:65.collect { :n |
	n.unitaryDivisors.harmonicMean
}.denominator.discretePlot
~~~

![](sw/spl/Help/Image/unitaryDivisors-D.svg)

Number of odd unitary divisors of _n_,
OEIS [A068068](https://oeis.org/A068068):

~~~spl svg=E
1:55.collect { :n |
	n.unitaryDivisors.count(isOdd:/1)
}.discretePlot
~~~

![](sw/spl/Help/Image/unitaryDivisors-E.svg)

* * *

See also: divisors, unitaryDivisorSigma

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnitaryDivisor.html),
_OEIS_
[1](https://oeis.org/A077610)
[2](https://oeis.org/A063937),
_Python_
[1](https://docs.sympy.org/latest/modules/ntheory.html#sympy.ntheory.factor_.udivisors),
_W_
[1](https://en.wikipedia.org/wiki/Unitary_divisor)
