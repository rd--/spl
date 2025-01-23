# hslToHsv

- _hslToHsv(hsl)_

Answer an _(h,s,v)_ triple given an _(h,s,l)_ triple.

```
>>> let rgb = [1/3 2/3 1/2];
>>> let hsv = rgb.rgbToHsv;
>>> let hsl = rgb.rgbToHsl;
>>> (hsv, hsl, hsl.hslToHsv ~ hsv)
(
	[5/12 1/2 2/3],
	[5/12 1/3 1/2],
	true
)
```

* * *

See also: hslToRgb, hsvToHsl, rgbToHsl, rgbToHsv

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/HSL_and_HSV)

