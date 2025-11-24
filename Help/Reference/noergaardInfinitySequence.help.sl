# noergaardInfinitySequence

- _noergaardInfinitySequence(n, v=0)_

Answer the first _n_ terms of Per Nørgårds _infinity sequence_.

Calculate first few terms,
OEIS [A004718](https://oeis.org/A004718):

```
>>> 23.noergaardInfinitySequence
[
	 0  1 -1  2  1  0 -2  3 -1  2
	-0  1  2 -1 -3  4  1  0 -2  3
	 0  1 -1
]
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

Scatter plot of first few terms of first variant:

~~~spl svg=C
250.noergaardInfinitySequence(1)
.scatterPlot
~~~

![](sw/spl/Help/Image/noergaardInfinitySequence-C.svg)

* * *

See also: inventorySequence, memoize, noergaardInfinityTree, noergaardRhythmicInfinitySystem

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A004718)
[2](https://oeis.org/A256184)

Further Reading: Allouche 2003, Kullberg 1996
