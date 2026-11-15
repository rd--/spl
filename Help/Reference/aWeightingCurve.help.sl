# aWeightingCurve

- _aWeightingCurve(x)_

Answer the A-weighting curve used for measuring perceived loudness of sound.

```
>>> 0.0.aWeightingCurve
0

>>> 444.75.aWeightingCurve
0.5
```

Linear plot:

~~~spl svg=A
(16.midiCps -- 108.midiCps)
.functionPlot(
	aWeightingCurve/1
)
~~~

![](Help/Image/aWeightingCurve-A.svg)

Semi-logarithmic plot:

~~~spl svg=B
(16.midiCps -- 108.midiCps)
.logLinearPlot(
	aWeightingCurve/1
)
~~~

![](Help/Image/aWeightingCurve-B.svg)

Logarithmic plot:

~~~spl svg=C
(16.midiCps -- 108.midiCps)
.logLinearPlot { :x |
	x.aWeightingCurve.log(10) * 20 + 2
}
~~~

![](Help/Image/aWeightingCurve-C.svg)

* * *

See also: bWeightingCurve

Guides: Curve Functions, Signal Processing Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/A-weighting)
