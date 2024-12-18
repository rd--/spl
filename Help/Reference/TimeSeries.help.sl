# TimeSeries

- _TimeSeries(aMatrix)_

A `Type` representing a time series, specified as a two-column matrix of _(time, value)_ pairs.

```
>>> let ts = TimeSeries(
>>> 	[1 2; 2 1; 5 6; 10 5; 12 7; 15 4]
>>> );
>>> (
>>> 	ts.size,
>>> 	ts.startTime,
>>> 	ts.endTime,
>>> 	ts.min,
>>> 	ts.max,
>>> 	ts.isRegularlySampled
>>> )
(6, 1, 15, 1, 7, false)
```

Time series implements `at`:

```
>>> let ts = [1 3; 2 2; 3 1].TimeSeries;
>>> (ts.at(1), ts[3])
(3, 1)
```

Time series implements `atPut`,
if the key already exists the associated value is replaced,
else a new entry is made:

```
>>> let ts = [1 3; 2 2; 3 1].TimeSeries;
>>> ts.atPut(1, 5);
>>> ts[4] := -1;
>>> ts[2] := 3;
>>> ts.contents
[1 5; 2 3; 3 1; 4 -1]
```

`window` selects a section of a time series:

```
>>> [1 1; 2 2; 3 3; 4 4; 5 5]
>>> .TimeSeries
>>> .window(2, 4)
[2 2; 3 3; 4 4].TimeSeries
```

`asTimeSeries` constructs a time series from separate data and time lists:

```
>>> [2 1 6 5 7 4].asTimeSeries(
>>> 	[1 2 5 10 12 15]
>>> ).contents
[
	 1  2;
	 2  1;
	 5  6;
	10  5;
	12  7;
	15  4
]
```

Using `Range` to specify times:

```
>>> [2 1 6 5 7 4].asTimeSeries(1:6)
TimeSeries([1 2; 2 1; 3 6; 4 5; 5 7; 6 4])
```

`merge` merges two time series to create a third:

```
>>> let p = [1 -1; 3 -3; 5 -5].TimeSeries;
>>> let q = [2 -2; 4 -4].TimeSeries;
>>> let a = p.merge(q);
>>> let b = q.merge(p);
>>> (a, a = b)
(
	-1:-5.asTimeSeries(1:5),
	true
)
```

The ternary form allows a two argument block that is used to resolve conflicts,
else conflicts are treated as errors:

```
>>> let p = [1 -1; 2 -2; 3 -3].TimeSeries;
>>> let q = [2 '?'; 4 -4; 5 -5].TimeSeries;
>>> let a = p.merge(q, leftIdentity:/2);
>>> let b = q.merge(p, rightIdentity:/2);
>>> (a, a = b)
(
	-1:-5.asTimeSeries(1:5),
	true
)
```

`discretePlot` of time series:

~~~
[2 1 6 5 7 4].asTimeSeries(
	[1 2 5 10 12 15]
).discretePlot
~~~

![](sw/spl/Help/Image/TimeSeries-A.svg)

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TimeSeriesAnalysis.html)
[2](https://reference.wolfram.com/language/ref/TimeSeries.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/timeseries.html),
_W_
[1](https://en.wikipedia.org/wiki/Time_series)
