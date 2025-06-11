# aWeightingCurve

- _aWeightingCurve(x)_

Answer the A-weighting curve used for measuring perceived loudness of sound.

Linear plot:

~~~spl svg=A
(1 -- 1E5).functionPlot(
	aWeightingCurve:/1
)
~~~

![](sw/spl/Help/Image/aWeightingCurve-A.svg)

Semi-logarithmic plot:

~~~spl svg=B
(1 -- 1E5).logLinearPlot(
	aWeightingCurve:/1
)
~~~

![](sw/spl/Help/Image/aWeightingCurve-B.svg)

Logarithmic plot:

~~~spl svg=C
(1 -- 1E5).logLinearPlot { :x |
	x.aWeightingCurve.log(10) * 20 + 2
}
~~~

![](sw/spl/Help/Image/aWeightingCurve-C.svg)

* * *

See also: bWeightingCurve

Guides: Signal Processing Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/A-weighting)
