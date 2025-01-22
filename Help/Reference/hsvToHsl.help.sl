# hsvToHsl

- _hsvToHsl(hsv)_

Answer an _(h,s,l)_ triple given an _(h,s,v)_ triple.

```
>>> let rgb = [1/3 2/3 1/2];
>>> let hsl = rgb.rgbToHsl;
>>> let hsv = rgb.rgbToHsv;
>>> (hsl, hsv, hsv.hsvToHsl ~ hsl)
(
	[5/12 1/3 1/2],
	[5/12 1/2 2/3],
	true
)
```

* * *

See also: hslToRgb, hslToHsv, rgbToHsl, rgbToHsv

