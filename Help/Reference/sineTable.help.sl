# sineTable

- _sineTable(anInteger, amplitudeList, phaseList)_

Answer a `List` of _anInteger_ places with a sum of sines at the indicated amplitudes and phases.
The table is _not_ normalised, see `normalizeSignal`.

Approximation of sawtooth wave:

~~~spl svg=A
1024.sineTable(
	1 / 1:6,
	[0]
).normalizeSignal.linePlot
~~~

![](sw/spl/Help/Image/sineTable-A.svg)

More accurate approximation:

~~~spl svg=B
512.sineTable(
	1 / 1:128,
	[0]
).normalizeSignal.linePlot
~~~

![](sw/spl/Help/Image/sineTable-B.svg)

* * *

See also: addSine, normalizeSignal, sineFill

Categories: Wavetable
