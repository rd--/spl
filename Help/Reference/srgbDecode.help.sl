# srgbDecode

- _srgbDecode(aNumber)_

Decode non-linear _Rgb_ values to linear _Rgb_ values using the _Srgb_ colour component transfer function (Cctf).
Also called the inverse companding or gamma function.

Threads over lists:

```
>>> [0.4 0.2 0.7]
>>> .srgbEncode
>>> .srgbDecode
[0.4 0.2 0.7]
```

Plot curve:

~~~spl svg=A
(0 -- 1).functionPlot(
	srgbDecode:/1
)
~~~

![](sw/spl/Help/Image/srgbDecode-A.svg)

* * *

See also: Colour, srgbEncode

References:
_W_
[1](https://en.wikipedia.org/wiki/SRGB)
