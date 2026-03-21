# noergaardInfinitySequence

- _noergaardInfinitySequence(n, v='A')_

Answer the first _n_ terms of Per Nørgård’s _infinity sequence_.

Calculate first few terms,
OEIS [A004718](https://oeis.org/A004718):

```
>>> 23.noergaardInfinitySequence
[
	 0  1 -1  2  1  0 -2  3 -1  2
	 0  1  2 -1 -3  4  1  0 -2  3
	 0  1 -1
]
```

The terms can be calculated using a closed form:

```
>>> 0:22.collect(
>>> 	noergaardInfinityNumber:/1
>>> )
[
	 0  1 -1  2  1  0 -2  3 -1  2
	 0  1  2 -1 -3  4  1  0 -2  3
	 0  1 -1
]
```

The sequence is square free:

```
>>> 200.noergaardInfinitySequence
>>> .isSquareFreeWord
true
```

Another variant of Per Nørgård’s infinity sequence,
OEIS [A255723](https://oeis.org/A255723):

```
>>> 74.noergaardInfinitySequence('Z')
[
	0 -2 -1 2 -2 -4 1 0 -1 -3
	0 1 2 0 -3 4 -2 -4 1 0
	-4 -6 3 -2 1 -1 -2 3 0 -2
	-1 2 -1 -3 0 1 -3 -5 2 -1
	0 -2 -1 2 1 -1 -2 3 2
	0 -3 4 0 -2 -1 2 -3 -5 2 -1
	4 2 -5 6 -2 -4 1 0 -4 -6
	3 -2 1 -1
]
```

Per Nørgård’s infinity sequence,
discrete plot,
OEIS [A004718](https://oeis.org/A004718):

~~~spl svg=A oeis=A004718
99.noergaardInfinitySequence
.discretePlot
~~~

![](Help/Image/noergaardInfinitySequence-A.svg)

Per Nørgård’s infinity sequence,
scatter plot,
OEIS [A004718](https://oeis.org/A004718):

~~~spl svg=B oeis=A004718
333.noergaardInfinitySequence
.scatterPlot
~~~

![](Help/Image/noergaardInfinitySequence-B.svg)

Positions of zeroes,
zero-indexed,
OEIS [A083866](https://oeis.org/A083866):

```
>>> 81.noergaardInfinitySequence
>>> .indicesOf(0) - 1
[0 5 10 17 20 27 34 40 45 54 65 68 75 80]

>>> 0:80.select { :n |
>>> 	n.noergaardInfinityNumber = 0
>>> }
[0 5 10 17 20 27 34 40 45 54 65 68 75 80]
```

The first variant of Per Nørgård’s infinity sequence,
OEIS [A256184](https://oeis.org/A256184):

```
>>> 72.noergaardInfinitySequence('B')
[
	 0 -2 -1  2 -4 -3  1 -3 -2 -2
	 0  1  4 -6 -5  3 -5 -4 -1 -1
	 0  3 -5 -4  2 -4 -3  2 -4 -3
	 0 -2 -1 -1 -1  0 -4  2  3  6
	-8 -7  5 -7 -6 -3  1  2  5 -7
	-6  4 -6 -5  1 -3 -2  1 -3 -2
	 0 -2 -1 -3  1  2  5 -7 -6  4
	-6 -5
]
```

Note repetition of order three:

```
>>> 72.noergaardInfinitySequence('B')
>>> .atAll(33:35)
[-1 -1 -1]

>>> 36.noergaardInfinitySequence('B')
>>> .isSquareFreeWord
false
```

The first variant of Per Nørgård’s infinity sequence,
OEIS [A256184](https://oeis.org/A256184):

~~~spl svg=C oeis=A256184
250.noergaardInfinitySequence('B')
.scatterPlot
~~~

![](Help/Image/noergaardInfinitySequence-C.svg)

The second variant of Per Nørgård’s infinity sequence,
OEIS [A256185](https://oeis.org/A256185):

```
>>> 73.noergaardInfinitySequence('C')
[
	  0 -3 -2  3 -6  1  2  -5  0 -3
	  0 -5  6 -9  4 -1 -2  -3 -2 -1
	 -4  5 -8  3  0 -3 -2   3 -6  1
	  0 -3 -2  5 -8  3 -6   3 -8  9
	-12  7 -4  1 -6  1 -4  -1  2 -5
	  0  3 -6  1  2 -5  0   1 -4 -1
	  4 -7  2 -5  2 -7  8 -11  6 -3
	  0 -5  0
]
```

Note that only odd intervals occur:

```
>>> 73.noergaardInfinitySequence('C')
>>> .differences
>>> .allSatisfy(isOdd:/1)
true
```

The second variant of Per Nørgård’s infinity sequence,
OEIS [A256185](https://oeis.org/A256185):

~~~spl svg=D oeis=A256185
250.noergaardInfinitySequence('C')
.scatterPlot
~~~

![](Help/Image/noergaardInfinitySequence-D.svg)

First differences of Nørgård’s infinity sequence,
OEIS [A256187](https://oeis.org/A256187):

~~~spl svg=E oeis=A256187
100.noergaardInfinitySequence
.differences.discretePlot
~~~

![](Help/Image/noergaardInfinitySequence-E.svg)

One for zero else zero in Nørgård’s infinity sequence,
OEIS [A361016](https://oeis.org/A361016):

~~~spl svg=F oeis=A361016
200.noergaardInfinitySequence
.collect(isZero:/1).boole.discretePlot
~~~

![](Help/Image/noergaardInfinitySequence-F.svg)

Another variant of Per Nørgård’s infinity sequence,
OEIS [A255723](https://oeis.org/A255723):

~~~spl svg=G oeis=A255723
250.noergaardInfinitySequence('Z')
.scatterPlot
~~~

![](Help/Image/noergaardInfinitySequence-G.svg)

* * *

See also: inventorySequence, memoize, noergaardInfinityNumber, noergaardRhythmicInfinitySystem

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A004718)
[2](https://oeis.org/A256184)
[3](https://oeis.org/A083866)
[4](https://oeis.org/A256185)

Further Reading: Allouche 2003, Au 2017, Kullberg 1996
