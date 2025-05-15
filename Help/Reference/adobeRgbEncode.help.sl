# adobeRgbEncode

- _adobeRgbEncode(aNumber)_

Encode linear _Rgb_ values to non-linear _Rgb_ values using the _Adobe_ colour component transfer function (Cctf).
Also called the companding or gamma function.

At `SmallFloat`:

```
>>> 0.5.adobeRgbEncode
0.7297
```

At `List`:

```
>>> [1 0.8 0.25].adobeRgbEncode
[1 0.9035 0.5324]
```

Plot curve:

~~~spl svg=A
(0 -- 1).functionPlot(
	adobeRgbEncode:/1
)
~~~

![](sw/spl/Help/Image/adobeRgbEncode-A.svg)

Inverse is `adobeRgbDecode`:

~~~spl svg=B
(0 -- 1).functionPlot { :x |
	x.adobeRgbEncode.adobeRgbDecode
}
~~~

![](sw/spl/Help/Image/adobeRgbEncode-B.svg)

* * *

See also: adobeRgbDecode, Colour, List, RgbColour, SmallFloat

Guides: Colour Functions
