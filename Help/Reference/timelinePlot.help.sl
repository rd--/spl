# timelinePlot

- _timelinePlot([t₁ t₂ …; …])_

Answer a timeline plot with times _(t₁, t₂, …)_.

Plot timeline of `List` of times:

~~~spl svg=A
[1 2 3 5 7 11 23]
.timelinePlot
~~~

![](sw/spl/Help/Image/timelinePlot-A.svg)

Plot timeline of `List` of lists of times,
each time sequence is drawn on a separate _track_:

~~~spl svg=B
[
	1 2 3 5 7 11 23;
	8 10 13 18 19;
	12 15 16 21
].timelinePlot
~~~

![](sw/spl/Help/Image/timelinePlot-B.svg)

At `TemporalData`,
draws the time values of each component path on a separate track:

~~~spl svg=C
let r = Sfc32(801323);
PoissonProcess(2.7)
.randomFunction(r, [0 15], 4)
.timelinePlot
~~~

![](sw/spl/Help/Image/timelinePlot-C.svg)

* * *

See also: scatterPlot, TemporalData, TimeSeries

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TimelinePlot.html)
