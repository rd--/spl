# cmyToRgb

- _cmyToRgb(cmy)_

Convert from _Cmy_ colourspace to _Rgb_ colourspace.

```
>>> let cmy = [0.5438 0.9692 0.9591];
>>> let rgb = cmy.cmyToRgb;
>>> (rgb, 1 - cmy = rgb)
([0.4562 0.0308 0.0409], true)
```

Evaluate symbolically:

```
>> [𝒄 𝒎 𝒚].cmyToRgb
[(- 1 c), (- 1 m), (- 1 y)]
```

Cyan, magenta and yellow are the negations of red, green and blue.

```
>>> RgbColour([1 0 0], 1)
>>> .negated
>>> .isCyan
true

>>> RgbColour([0 1 0], 1)
>>> .negated
>>> .isMagenta
true

>>> RgbColour([0 0 1], 1)
>>> .negated
>>> .isYellow
true
```

* * *

See also: Colour, rgbToCmy

References:
_Python_
[1](https://colour.readthedocs.io/en/develop/generated/colour.CMY_to_RGB.html),

_W_
[1](https://en.wikipedia.org/wiki/CMYK_color_model)
