# noergaardInfinitySequence

- _noergaardInfinitySequence(n)_

Answer the first _n_ terms of Per Nørgårds _infinity sequence_.

Calculate first few terms:

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
99.noergaardInfinitySequence.discretePlot
~~~

![](sw/spl/Help/Image/noergaardInfinitySequence-A.svg)

Scatter plot of first few terms:

~~~spl svg=B
333.noergaardInfinitySequence.scatterPlot
~~~

![](sw/spl/Help/Image/noergaardInfinitySequence-B.svg)

* * *

See also: inventorySequence, memoize, noergaardInfinityTree, noergaardRhythmicInfinitySystem

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A004718)

Further Reading: Allouche 2003, Kullberg 1996
