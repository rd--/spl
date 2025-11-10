# rgbString

- _rgbString(c)_

Answer the _Svg_ or _Css_ format _rgb_-notation string for the colour _c_.

At `RgbColour`, with unit alpha:

```
>>> RgbColour([1 0.8 0.25], 1).rgbString
'rgb(255,204,64)'
```

With `alpha`:

```
>>> RgbColour([0.2 0.6 0.75], 0.25)
>>> .rgbString
'rgba(51,153,191,0.25)'
```

At `RgbColour` after _Srgb_ encoding:

```
>>> RgbColour([1 0.8 0.25], 1)
>>> .srgbEncode
>>> .rgbString
'rgb(255,231,137)'
```

* * *

See also: Colour, Svg, RgbColour

Guides: Colour Functions
