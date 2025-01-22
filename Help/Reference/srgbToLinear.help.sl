# srgbToLinear

- _srgbToLinear(aNumber)_

The Srgb transfer (or companding or gamma) function,
converting to linear from Srgb.

Threads over lists:

```
>>> [0.4 0.2 0.7]
>>> .srgbFromLinear
>>> .srgbToLinear
[0.4 0.2 0.7]
```

Plot curve:

~~~spl svg=A
(0 -- 1).functionPlot(
	srgbToLinear:/1
)
~~~

![](sw/spl/Help/Image/srgbToLinear-A.svg)

* * *

See also: Colour, srgbFromLinear

References:
_W_
[1](https://en.wikipedia.org/wiki/SRGB)
