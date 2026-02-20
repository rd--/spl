# rationalUnrank

- _rationalUnrank(n, m='Canonical')_

Answer the _n_-th rational number according to the ranking method _m_.

First few terms of the _'Canonical'_ method:

```
>>> 1:23.rationalUnrank('Canonical')
[
	1/1 1/2 2/1 1/3 3/1 1/4 2/3 3/2 4/1
	1/5 5/1 1/6 2/5 3/4 4/3 5/2 6/1 1/7
	3/5 5/3 7/1 1/8 2/7
]
```

Numerators,
OEIS [A020652](https://oeis.org/A020652):

```
>>> 1:22.rationalUnrank('Canonical')
>>> .numerator
[1 1 2 1 3 1 2 3 4 1 5 1 2 3 4 5 6 1 3 5 7 1]
```

Denominators,
OEIS [A020653](https://oeis.org/A020653):

```
>>> 1:22.rationalUnrank('Canonical')
>>> .denominator
[1 2 1 3 1 4 3 2 1 5 1 6 5 4 3 2 1 7 5 3 1 8]
```

First few terms of the _'CalkinWilf'_ method:

```
>>> 1:23.rationalUnrank('CalkinWilf')
[
	1/1 1/2 2/1 1/3 3/2 2/3 3/1 1/4 4/3
	3/5 5/2 2/5 5/3 3/4 4/1 1/5 5/4 4/7
	7/3 3/8 8/5 5/7 7/2
]

>>> 23.calkinWilfSequence
[
	1/1 1/2 2/1 1/3 3/2 2/3 3/1 1/4 4/3
	3/5 5/2 2/5 5/3 3/4 4/1 1/5 5/4 4/7
	7/3 3/8 8/5 5/7 7/2
]
```

Plot first few terms of the _'Canonical'_ method:

~~~spl svg=A
1:45.rationalUnrank('Canonical')
.discretePlot
~~~

![](sw/spl/Help/Image/rationalUnrank-A.svg)

Log scale plot of first few terms of the _'Canonical'_ method:

~~~spl svg=B
1:100.rationalUnrank('Canonical')
.log.discretePlot
~~~

![](sw/spl/Help/Image/rationalUnrank-B.svg)

Scatter plot of first few terms of the _'Canonical'_ method
with the numerator on the _x_-axis,
and the denominator on the _y_-axis:

~~~spl svg=C
1:200.rationalUnrank('Canonical')
.collect(components:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/rationalUnrank-C.svg)

* * *

See also: calkinWilfSequence, oeisFunction, sternBrocotNumber

Guides: Integer Sequence Functions
