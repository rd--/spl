# rationalOrdering

- _rationalOrdering(k, n)_

Answer the first _n_ terms of the ordering of the rational numbers specified by the algorithm _k_.

The Fibonacci, or rabbit, ordering of the rational numbers:

```
>>> 'Fibonacci'.rationalOrdering(20)
[
	1/1
	2/1
	3/1 1/2
	4/1 1/3 3/2
	5/1 1/4 4/3 5/2 2/3
	6/1 1/5 5/4 7/3 3/4 7/2 2/5 5/3
]
```

Numerators in the Fibonacci ordering of the positive rational numbers,
OEIS [A226081](https://oeis.org/A226081):

```
>>> 'Fibonacci'.rationalOrdering(79)
>>> .numerator
[
	 1  2  3  1  4  1  3  5  1  4
	 5  2  6  1  5  7  3  7  2  5
	 7  1  6  9  4 10  3  7  9  2
	 7  8  3  8  1  7 11  5 13  4
	 9 13  3 10 11  4 11  2  9 12
	 5 11  3  8  9  1  8 13  6 16
	 5 11 17  4 13 14  5 16  3 13
	17  7 15  4 11 13  2 11 16
]
```

Denominators in the Fibonacci ordering of the positive rational numbers,
OEIS [A226080](https://oeis.org/A226080):

```
>>> 'Fibonacci'.rationalOrdering(83)
>>> .denominator
[
	 1  1  1  2  1  3  2  1  4  3
	 2  3  1  5  4  3  4  2  5  3
	 1  6  5  4  5  3  7  4  2  7
	 5  3  5  1  7  6  5  6  4  9
	 5  3 10  7  4  7  2  9  7  5
	 7  3  8  5  1  8  7  6  7  5
	11  6  4 13  9  5  9  3 13 10
	 7 10  4 11  7  2 11  9  7  9
	 5 12  7
]
```

The Fibonacci, or rabbit, ordering of the rational numbers:

~~~spl svg=A
'Fibonacci'.rationalOrdering(115)
.discretePlot
~~~

![](Help/Image/rationalOrdering-A.svg)

Numerators in the Fibonacci ordering of the positive rational numbers,
OEIS [A226081](https://oeis.org/A226081):

~~~spl svg=B oeis=A226081
'Fibonacci'.rationalOrdering(115)
.numerator
.discretePlot
~~~

![](Help/Image/rationalOrdering-B.svg)

Denominators in the Fibonacci ordering of the positive rational numbers,
OEIS [A226080](https://oeis.org/A226080):

~~~spl svg=C oeis=A226080
'Fibonacci'.rationalOrdering(115)
.denominator
.discretePlot
~~~

![](Help/Image/rationalOrdering-C.svg)

Numerators in the Fibonacci ordering of the positive rational numbers,
dense scatter plot,
OEIS [A226081](https://oeis.org/A226081):

~~~spl png=D oeis=A226081
'Fibonacci'.rationalOrdering(6000)
.numerator
.denseScatterPlot
~~~

![](Help/Image/rationalOrdering-D.png)

Denominators in the Fibonacci ordering of the positive rational numbers,
dense scatter plot,
OEIS [A226080](https://oeis.org/A226080):

~~~spl png=E oeis=A226080
'Fibonacci'.rationalOrdering(6000)
.denominator
.denseScatterPlot
~~~

![](Help/Image/rationalOrdering-E.png)

There is a direct form for calculating the Fibonacci, or rabbit, ordering of the rational numbers:

```
>>> 7.rationalOrderingFibonacci
[
	1/1
	;
	2/1
	;
	3/1 1/2
	;
	4/1 1/3 3/2
	;
	5/1 1/4 4/3 5/2 2/3
	;
	6/1 1/5 5/4 7/3 3/4 7/2 2/5 5/3
	;
	7/1 1/6 6/5 9/4 4/5 10/3 3/7 7/4
	9/2 2/7 7/5 8/3 3/5
]
```

The size of each row is,
in most cases,
given by the Fibonacci numbers:

```
>>> 14.rationalOrderingFibonacci
>>> .collect(size:/1)
[1 1 2 3 5 8 14 21 34 55 89 144 233 377]

>>> 1:14.fibonacci
[1 1 2 3 5 8 13 21 34 55 89 144 233 377]
```

* * *

See also: fibonacci, Fraction, rationalUnrank

Guides: Integer Sequence Functions
