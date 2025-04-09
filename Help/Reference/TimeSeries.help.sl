# TimeSeries

- _TimeSeries([t₁ v₁; t₂ v₂ …])_
- _TimeSeries(v, t)_

A `Type` representing a time series,
specified either as a two-column matrix of _(time, value)_ pairs,
or as a pair of _value_ and _time_ vectors.

`pathLength` tells the number of entries,
`valueDimensions` tells the `dimensions` of each value,
`firstTime` tells the time of the first entry and `lastTime` that of the last,
`min` tells the least value and `max` the greatest,
`minimumTimeIncrement` tells the least time difference,
`isRegularlySampled` tells if the items are equally spaced in time:
and `isMultivariate` tells if the values are not scalar or single column:

```
>>> let ts = TimeSeries(
>>> 	[1 2; 2 1; 5 6; 10 5; 12 7; 15 4]
>>> );
>>> (
>>> 	ts.pathLength,
>>> 	ts.valueDimensions,
>>> 	ts.firstTime,
>>> 	ts.lastTime,
>>> 	ts.min,
>>> 	ts.max,
>>> 	ts.minimumTimeIncrement,
>>> 	ts.isRegularlySampled,
>>> 	ts.isMultivariate
>>> )
(6, 1, 1, 15, 1, 7, 1, false, false)
```

Accessors includes `times` (or equivalently `keys` or `indices`),
`values`,
`path`,
and `associations`:

```
>>> let ts = TimeSeries(
>>> 	[1 2; 2 1; 5 6; 10 5; 12 7; 15 4]
>>> );
>>> (
>>> 	ts.times,
>>> 	ts.values,
>>> 	ts.path,
>>> 	ts.associations
>>> )
(
	[1 2 5 10 12 15],
	[2 1 6 5 7 4],
	[1 2; 2 1; 5 6; 10 5; 12 7; 15 4],
	[
		1 -> 2,
		2 -> 1,
		5 -> 6,
		10 -> 5,
		12 -> 7,
		15 -> 4
	]
)
```

Time series implements `at` and the `Collection` trait:

```
>>> let ts = TimeSeries([1 3; 2 2; 3 1]);
>>> (ts.at(1), ts[3], ts + 1)
(3, 1, TimeSeries([1 4; 2 3; 3 2]))
```

Time series implements `atPut`,
if the key already exists the associated value is replaced,
else a new entry is made:

```
>>> let ts = [1 3; 2 2; 3 1].TimeSeries;
>>> ts.atPut(1, 5);
>>> ts[4] := -1;
>>> ts[2] := 3;
>>> ts.path
[1 5; 2 3; 3 1; 4 -1]
```

`window` selects a section of a time series:

```
>>> [1 1; 2 2; 3 3; 4 4; 5 5]
>>> .TimeSeries
>>> .window(2, 4)
[2 2; 3 3; 4 4].TimeSeries
```

The binary form of `TimeSeries` constructs a time series from separate data and time lists:

```
>>> TimeSeries(
>>> 	[2 1 6 5 7 4],
>>> 	[1 2 5 10 12 15]
>>> ).path
[
	 1  2;
	 2  1;
	 5  6;
	10  5;
	12  7;
	15  4
]
```

Using list range syntax to specify times:

```
>>> TimeSeries([2 1 6 5 7 4], [1 .. 6])
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
	TimeSeries([-1 .. -5], [1 .. 5]),
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
	TimeSeries([-1 .. -5], [1 .. 5]),
	true
)
```

`discretePlot` of time series:

~~~spl svg=A
TimeSeries(
	[2 1 6 5 7 4],
	[1 2 5 10 12 15]
).discretePlot
~~~

![](sw/spl/Help/Image/TimeSeries-A.svg)

Rescale a time series to run from 0 to 20:

```
>>> TimeSeries([0 3; 1 5; 2 7; 3 2; 4 5])
>>> .rescale(0, 20)
TimeSeries([0 3; 5 5; 10 7; 15 2; 20 5])
```

Shift the series ahead by two:

```
>>> TimeSeries([0 3; 1 5; 2 7; 3 2; 4 5])
>>> .shift(2)
TimeSeries([2 3; 3 5; 4 7; 5 2; 6 5])
```

Square the values in a time series:

```
>>> TimeSeries([3 2 4 7], [1 .. 4])
>>> .squared
TimeSeries([9 4 16 49], [1 .. 4])
```

Find the sums of the components of a vector-valued time series:

```
>>> TimeSeries([1 2; 3 4; 5 6], [1 2 3])
>>> .collect(sum:/1)
>>> .path
[1 3; 2 7; 3 11]
```

Find the `mean` of a time series:

```
>>> let v = [3 8 4 11 9 2];
>>> let t = [1 3 5 7 8 10];
>>> TimeSeries(v, t).mean
6.1667
```

Insert a value into a time series at time _2.5_:

```
>>> let ts = TimeSeries([3 5 7], [1 2 3]);
>>> (ts[2.5] := 6, ts.path)
(6, [1 3; 2 5; 2.5 6; 3 7])
```

Replace the value at time _2_:

```
>>> let ts = TimeSeries([3 5 7], [1 2 3]);
>>> (ts[2] := -5, ts.path)
(-5, [1 3; 2 -5; 3 7])
```

Extract components of vector-valued collection:

```
>>> TimeSeries([1 2; 3 4; 5 6], [1 2 3])
>>> .pathComponents
[
	TimeSeries([1 3 5], [1 2 3]),
	TimeSeries([2 4 6], [1 2 3])
]
```

Resample and plot one component of a multi-variate time series:

~~~spl svg=B
TimeSeries(
	Sfc32(536721)
	.randomReal([0 1], [200 3]),
	1:200
)
.pathComponents[3]
.resample([1, 7 .. 193])
.linePlot
~~~

![](sw/spl/Help/Image/TimeSeries-B.svg)

Plot linear interpolation function of time series:

~~~spl svg=C
(1 -- 15).functionPlot(
	TimeSeries(
		[2 1 6 5 7 4],
		[1 2 5 10 12 15]
	).interpolation('Linear')
)
~~~

![](sw/spl/Help/Image/TimeSeries-C.svg)

Plot nearest-neighbor interpolation function of time series:

~~~spl svg=D
(1 -- 15).functionPlot(
	TimeSeries(
		[2 1 6 5 7 4],
		[1 2 5 10 12 15]
	).interpolation('NearestNeighbor')
)
~~~

![](sw/spl/Help/Image/TimeSeries-D.svg)

Plot cubic-spline interpolation function of time series:

~~~spl svg=E
(1 -- 15).functionPlot(
	TimeSeries(
		[2 1 6 5 7 4],
		[1 2 5 10 12 15]
	).interpolation('CubicSpline')
)
~~~

![](sw/spl/Help/Image/TimeSeries-E.svg)

Plot Akima interpolation function of time series:

~~~spl svg=F
(1 -- 15).functionPlot(
	TimeSeries(
		[2 1 6 5 7 4],
		[1 2 5 10 12 15]
	).interpolation('Akima')
)
~~~

![](sw/spl/Help/Image/TimeSeries-F.svg)

* * *

See also: isRegularlySampled, minimumTimeIncrement, resample, TemporalData

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TimeSeriesAnalysis.html)
[2](https://reference.wolfram.com/language/ref/TimeSeries.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/timeseries.html),
_W_
[1](https://en.wikipedia.org/wiki/Time_series)
