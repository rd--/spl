# srgbFromLinear

- _srgbFromLinear(aNumber)_

The Srgb transfer (or companding or gamma) function,
converting from Srgb to linear.

Plot curve:

~~~spl svg=A
(0 -- 1).functionPlot(
	srgbFromLinear:/1
)
~~~

![](sw/spl/Help/Image/srgbFromLinear-A.svg)

Inverse is identity:

~~~spl svg=B
(0 -- 1).functionPlot { :x |
	x.srgbFromLinear.srgbToLinear
}
~~~

![](sw/spl/Help/Image/srgbFromLinear-B.svg)

* * *

See also: Colour, srgbToLinear

References:
_W_
[1](https://en.wikipedia.org/wiki/SRGB)
