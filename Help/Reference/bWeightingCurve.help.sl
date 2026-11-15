# bWeightingCurve

- _bWeightingCurve(x)_

Answer the B-weighting curve used for measuring perceived loudness of sound.

Linear plot:

~~~spl svg=A
(16.midiCps -- 108.midiCps)
.functionPlot(
	bWeightingCurve/1
)
~~~

![](Help/Image/bWeightingCurve-A.svg)

Logarithmic plot:

~~~spl svg=B
(16.midiCps -- 108.midiCps)
.logLinearPlot(
	bWeightingCurve/1
)
~~~

![](Help/Image/bWeightingCurve-B.svg)

Logarithmic plot:

~~~spl svg=C
(16.midiCps -- 108.midiCps)
.logLinearPlot { :x |
	x.bWeightingCurve.log(10) * 20 + 0.17
}
~~~

![](Help/Image/bWeightingCurve-C.svg)

* * *

See also: aWeightingCurve

Guides: Signal Processing Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/A-weighting)
