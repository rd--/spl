# bWeightingCurve

- _bWeightingCurve(x)_

Answer the B-weighting curve used for measuring perceived loudness of sound.

Linear plot:

~~~spl svg=A
(1 -- 1E5).functionPlot(
	bWeightingCurve:/1
)
~~~

![](sw/spl/Help/Image/bWeightingCurve-A.svg)

Logarithmic plot:

~~~spl svg=B
(1 -- 1E5).logLinearPlot(
	bWeightingCurve:/1
)
~~~

![](sw/spl/Help/Image/bWeightingCurve-B.svg)

Logarithmic plot:

~~~spl svg=C
(1 -- 1E5).logLinearPlot { :x |
	x.bWeightingCurve.log(10) * 20 + 0.17
}
~~~

![](sw/spl/Help/Image/bWeightingCurve-C.svg)

* * *

See also: aWeightingCurve

Guides: Signal Processing Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/A-weighting)
