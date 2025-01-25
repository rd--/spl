# srgbDecode

- _srgbDecode(aNumber | aList | aColour)_

Decode non-linear _Rgb_ values to linear _Rgb_ values using the _Srgb_ colour component transfer function (Cctf).
Also called the inverse companding or gamma function.

At `SmallFloat`:

```
0.73536.srgbDecode
0.5
```

At `List`:

```
>>> [0.4 0.2 0.7]
>>> .srgbEncode
>>> .srgbDecode
[0.4 0.2 0.7]
```

At `RgbColour`:

```
>>> RgbColour([0.66519 0.48453 0.85431], 1)
>>> .srgbDecode
RgbColour([0.4 0.2 0.7], 1)
```

Threads over lists:

```
>>> [0.66519 0.48453 0.85431; 1 0 1].srgbDecode
[0.4 0.2 0.7; 1 0 1]
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
_Python_
[1](https://colour.readthedocs.io/en/develop/generated/colour.cctf_decoding.html),
_W_
[1](https://en.wikipedia.org/wiki/SRGB)
