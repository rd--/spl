# srgbEncode

- _srgbEncode(c)_

Encode linear _Rgb_ values to non-linear _Rgb_ values using the _Srgb_ colour component transfer function (Cctf).
Also called the companding or gamma function.

At `SmallFloat`:

```
>>> 0.5.srgbEncode
0.73536
```

At `List`:

```
>>> [1 0.8 0.25].srgbEncode
[1 0.9063 0.5371]
```

At `RgbColour`:

```
>>> RgbColour([1 0.8 0.25], 1).srgbEncode
RgbColour([1 0.9063 0.5371], 1)
```

Threads over lists:

```
>>> [1 0.8 0.25; 1 0 1].srgbEncode
[1 0.9063 0.5371; 1 0 1]
```

Plot curve:

~~~spl svg=A
(0 -- 1).functionPlot(
	srgbEncode:/1
)
~~~

![](sw/spl/Help/Image/srgbEncode-A.svg)

Inverse is `srgbDecode`:

~~~spl svg=B
(0 -- 1).functionPlot { :x |
	x.srgbEncode.srgbDecode
}
~~~

![](sw/spl/Help/Image/srgbEncode-B.svg)

* * *

See also: Colour, List, srgbDecode, RgbColour, SmallFloat

Guides: Colour Functions

References:
_Python_
[1](https://colour.readthedocs.io/en/develop/generated/colour.cctf_encoding.html),
_W_
[1](https://en.wikipedia.org/wiki/SRGB)
