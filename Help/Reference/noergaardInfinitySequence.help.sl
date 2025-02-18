# noergaardInfinitySequence

- _noergaardInfinitySequence(anInteger)_

Answer the first _anInteger_ terms of Per Nørgårds _infinity sequence_.

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

This is distinct from Per Nørgårds rhythmic infinity system,
which is given at A073334 and is plotted as:

~~~spl svg=C
1:99.collect { :n |
	(n.integerDigits(2).split(=).size + 4)
	.fibonacci
}.discretePlot
~~~

![](sw/spl/Help/Image/noergaardInfinitySequence-C.svg)

* * *

See also: inventorySequence, noergaardInfinityTree

References:
_OEIS_
[1](https://oeis.org/A004718)
[2](https://oeis.org/A073334)

Further Reading: Allouche 2003, Kullberg 1996
