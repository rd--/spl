# calkinWilfSequence

- _calkinWilfSequence(n)_

Answer the first _n_ terms of the Calkin-Wilf sequence of rational numbers.

The first fifteen terms:

```
>>> 15.calkinWilfSequence
[
	1/1
	1/2 2/1
	1/3 3/2 2/3 3/1
	1/4 4/3 3/5 5/2 2/5 5/3 3/4 4/1
]
```

The denominators give the terms of Stern’s diatomic sequence,
OEIS [A002487](https://oeis.org/A002487):

```
>>> 90.calkinWilfSequence
>>> .collect(denominator:/1)
[
	 1  2  1  3  2  3  1  4  3  5
	 2  5  3  4  1  5  4  7  3  8
	 5  7  2  7  5  8  3  7  4  5
	 1  6  5  9  4 11  7 10  3 11
	 8 13  5 12  7  9  2  9  7 12
	 5 13  8 11  3 10  7 11  4  9
	 5  6  1  7  6 11  5 14  9 13
	 4 15 11 18  7 17 10 13  3 14
	11 19  8 21 13 18  5 17 12 19
]
```

The numerator of each succesive term is equal to the denominator of the previous term:

```
>>> let c = 99.calkinWilfSequence;
>>> c.adjacentPairsCollect { :p :q |
>>> 	q.numerator = p.denominator
>>> }.allTrue
true
```

Plot first few terms:

~~~spl svg=A
200.calkinWilfSequence.scatterPlot
~~~

![](sw/spl/Help/Image/calkinWilfSequence-A.svg)

Scatter plot of first few terms with the numerator on the _x_-axis,
and the denominator on the _y_-axis:

~~~spl svg=B
200.calkinWilfSequence
.collect(components:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/calkinWilfSequence-B.svg)

* * *

See also: calkinWilfTree

Guides: Integer Sequence Functions, Mathematical Sequences

References:
_OEIS_
[1](https://oeis.org/A002487)

Further Reading: Calkin 2000

Categories: Math, Sequence
