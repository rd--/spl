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
>>> 6.rationalOrderingFibonacci
[
	1/1;
	2/1;
	3/1 1/2;
	4/1 1/3 3/2;
	5/1 1/4 4/3 5/2 2/3;
	6/1 1/5 5/4 7/3 3/4 7/2 2/5 5/3
]
```

The size of each row is given by the Fibonacci numbers:

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
