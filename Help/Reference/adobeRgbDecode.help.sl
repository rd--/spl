# adobeRgbDecode

- _adobeRgbDecode(aNumber)_

Decode non-linear _Rgb_ values to linear _Rgb_ values using the _Adobe_ colour component transfer function (Cctf).
Also called the inverse companding or gamma function.

At `SmallFloat`:

```
>>> 0.73536.adobeRgbDecode
0.5086
```

At `List`:

```
>>> [0.4 0.2 0.7]
>>> .adobeRgbEncode
>>> .adobeRgbDecode
[0.4 0.2 0.7]
```

Plot curve:

~~~spl svg=A
(0 -- 1).functionPlot(
	adobeRgbDecode:/1
)
~~~

![](sw/spl/Help/Image/adobeRgbDecode-A.svg)

* * *

See also: Colour, adobeRgbEncode
