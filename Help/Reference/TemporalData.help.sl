# TemporalData

- _TemporalData([[t₁ v₁; t₂ v₂ …]…])_
- _TemporalData([v₁ v₂ …], [t₁ t₂ …])_

A `Type` that represents a temporal data collection given as lists of time-value pairs.

The number of paths can be retrieved using `pathCount`,
the path values can be retrieved using `pathList`,
the value sequences can be retrieved using `valueList`,
and the time sequences using `timeList`.
`minimumTimeIncrement` tells the least time difference across all paths,
`isRegularlySampled` tells if all paths are regularly sampled,
`dataPointCount` tells the total number of data points.

```
>>> let t = TemporalData(
>>> 	[
>>> 		0 0; 0.25 0.75; 0.75 0; 1 0:;
>>> 		0 0; 0.5 1; 1 0
>>> 	]
>>> );
>>> (
>>> 	t.pathCount,
>>> 	t.valueList,
>>> 	t.timeList,
>>> 	t.minimumTimeIncrement,
>>> 	t.isRegularlySampled,
>>> 	t.dataPointCount
>>> )
(
	2,
	[0 0.75 0 0; 0 1 0],
	[0 0.25 0.75 1; 0 0.5 1],
	[0.25 0.5],
	false,
	7
)
```

Plot temporal data:

~~~spl svg=A
TemporalData(
	[
		0 0; 0.25 0.75; 0.75 0; 1 0:;
		0 0; 0.5 1; 1 0
	]
).linePlot
~~~

![](sw/spl/Help/Image/TemporalData-A.svg)

Attach temporal information to some values:

~~~spl svg=B
let v = [2 1 6 5 7 4];
let t = [1 2 5 10 12 15];
TemporalData([v], [t]).linePlot
~~~

![](sw/spl/Help/Image/TemporalData-B.svg)

Create a collection of paths with equivalent times:

~~~spl svg=C
let p = [2 1 6 5 7 4];
let q = [4 7 5 6 1 2];
let t = [1 2 5 10 12 15];
TemporalData([p q], [t t]).linePlot
~~~

![](sw/spl/Help/Image/TemporalData-C.svg)

Resample irregular time series:

~~~spl svg=D
let r = Sfc32(567132);
PoissonProcess(5)
.randomFunction(r, [1 10], 1)
.resample([[1, 1.2 .. 10]])
.discretePlot
~~~

![](sw/spl/Help/Image/TemporalData-D.svg)

Resample multiple paths at equal times:

~~~spl svg=E
let r = Sfc32(178314);
PoissonProcess(5)
.randomFunction(r, [1 10], 5)
.resample(
	List(5, [1, 1.2 .. 10])
).scatterPlot
~~~

![](sw/spl/Help/Image/TemporalData-E.svg)

* * *

See also: TimeSeries

Guides: Random Processes

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TemporalData.html)
