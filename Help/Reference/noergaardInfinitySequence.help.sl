# noergaardInfinitySequence

- _noergaardInfinitySequence(n, v=0)_

Answer the first _n_ terms of Per Nørgårds _infinity sequence_.

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

Discrete plot of first few terms:

~~~spl svg=A
99.noergaardInfinitySequence
.discretePlot
~~~

![](sw/spl/Help/Image/noergaardInfinitySequence-A.svg)

Scatter plot of first few terms:

~~~spl svg=B
333.noergaardInfinitySequence
.scatterPlot
~~~

![](sw/spl/Help/Image/noergaardInfinitySequence-B.svg)

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

The first variant,
OEIS [A256184](https://oeis.org/A256184):

```
>>> 72.noergaardInfinitySequence(1)
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
>>> 72.noergaardInfinitySequence(1)
>>> .atAll(33:35)
[-1 -1 -1]

>>> 36.noergaardInfinitySequence(1)
>>> .isSquareFreeWord
false
```

Scatter plot of first few terms of first variant:

~~~spl svg=C
250.noergaardInfinitySequence(1)
.scatterPlot
~~~

![](sw/spl/Help/Image/noergaardInfinitySequence-C.svg)

The second variant,
OEIS [A256185](https://oeis.org/A256185):

```
>>> 73.noergaardInfinitySequence(2)
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
>>> 73.noergaardInfinitySequence(2)
>>> .differences
>>> .allSatisfy(isOdd:/1)
true
```

Scatter plot of first few terms of second variant:

~~~spl svg=D
250.noergaardInfinitySequence(2)
.scatterPlot
~~~

![](sw/spl/Help/Image/noergaardInfinitySequence-D.svg)

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
