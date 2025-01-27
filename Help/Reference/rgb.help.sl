# rgb

- _rgb(aColour)_

Answer the _rgb_ components of _aColour_.

```
>>> RgbColour([1, 0.8, 0.25], 1).rgb
[1 0.8 0.25]

>>> RgbColour([1, 0.8, 0.25], 1).srgbEncode.rgb
[1 0.9063 0.5371]
```

Threads over lists:

```
>>> Sfc32(361784)
>>> .randomColour([3])
>>> .rgb
[
	0.17075 0.05137 0.80406;
	0.45096 0.18293 0.05489;
	0.89833 0.89440 0.40245
]
```

* * *

See also: Colour, hsv, rgba, srgbEncode

Guides: Colour Functions
