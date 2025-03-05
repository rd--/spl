# TemporalData

- _TemporalData(aList)_

A `Type` that represents a temporal data collection given as lists of time-value pairs.

The number of paths can be retrieved using `pathCount`,
the path values can be retrieved using `pathList`,
the value sequences can be retrieved using `valueList`,
and the time sequences using `timeList`.

```
>>> let t = TemporalData(
>>> 	[
>>> 		0 0; 0.25 0.75; 0.75 0; 1 0:;
>>> 		0 0; 0.5 1; 1 0
>>> 	]
>>> );
>>> (t.pathCount, t.valueList, t.timeList)
(
	2,
	[0 0.75 0 0; 0 1 0],
	[0 0.25 0.75 1; 0 0.5 1]
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

* * *

See also: TimeSeries

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TemporalData.html)
