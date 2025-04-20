# pianoRollPlot

- _pianoRollPlot([t₁ d₁ n₁ …; t₂ d₂ n₂ …; …])_

Answer a piano-roll plot of a matrix of at least three-columns.
The initial three columns indicate the _start time_,
the _duration_,
and the _note number_.

Piano-roll plot of a seven note phrase,
notes may overlap and there may be gaps:

~~~spl svg=A
[
	1 2 60;
	2 1 67;
	3 2 69;
	5 1 72;
	5 2 64;
	6 1 62;
	9 1 48
].pianoRollPlot
~~~

![](sw/spl/Help/Image/pianoRollPlot-A.svg)

The matrix does not need to be sorted,
and note numbers need not be integers:

~~~spl svg=B
let r = Sfc32(953712);
UniformDistribution(
	[1 23; 1 3; 38 84]
)
.randomVariate(r, [37])
.pianoRollPlot
~~~

![](sw/spl/Help/Image/pianoRollPlot-B.svg)

* * *

See also: timelinePlot

References:
_W_
[1](https://en.wikipedia.org/wiki/Music_roll)
