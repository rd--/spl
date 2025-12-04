# sineTable

- _sineTable(n, [a₁ a₂ …], [ϕ₁ ϕ₂ …])_

Answer a `List` of _n_ places holding the sum of the sine functions of succesive harmonics at amplitudes _a_ and phases _ϕ_.
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

A pure tone:

~~~spl svg=C
256.sineTable([1], [0]).linePlot
~~~

![](sw/spl/Help/Image/sineTable-C.svg)

Plot approximation of square wave:

~~~spl svg=D
512.sineTable(
	[3 0 1 0 0 0 0 0 0.33],
	[0 0 0 0 0 0 0 0 1.pi]
).linePlot
~~~

![](sw/spl/Help/Image/sineTable-D.svg)

* * *

See also: addSine, gen09, normalizeSignal, sineFill

Guides: Signal Processing Functions

Categories: Wavetable
