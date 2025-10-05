# noergaardRhythmicInfinitySystem

- _noergaardRhythmicInfinitySystem(n)_

Answer the first _n_ terms of Per Nørgårds _rhythmic infinity system_.

Calculate first few terms:

```
>>> 77.noergaardRhythmicInfinitySystem
[
	 3  5  8  5  8 13  8  5  8 13
	21 13  8 13  8  5  8 13 21 13
	21 34 21 13  8 13 21 13  8 13
	 8  5  8 13 21 13 21 34 21 13
	21 34 55 34 21 34 21 13  8 13
	21 13 21 34 21 13  8 13 21 13
	 8 13  8  5  8 13 21 13 21 34
	21 13 21 34 55 34 21
]
```

Discrete plot of first few terms:

~~~spl svg=A
99.noergaardRhythmicInfinitySystem
.discretePlot
~~~

![](sw/spl/Help/Image/noergaardRhythmicInfinitySystem-A.svg)

Scatter plot of first few terms:

~~~spl svg=B
333.noergaardRhythmicInfinitySystem
.scatterPlot
~~~

![](sw/spl/Help/Image/noergaardRhythmicInfinitySystem-B.svg)

* * *

See also: noergaardInfinitySequence

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A073334)

Further Reading: Allouche 2003, Kullberg 1996, Shallit 2005
