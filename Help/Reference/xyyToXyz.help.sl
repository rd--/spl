# xyyToXyz

- _xyyToXyz(xyy)_

Convert from _Cie Xyy_ colourspace to _Cie Xyz_ tristimulus values.
Answer an _(x,y,z)_ triple given an _(x,y,y)_ triple,
all in _(0,1)_.

At specific value:

```
>>> [0.54370 0.32108 0.12197].xyyToXyz
[0.20654 0.12197 0.05137]
```

Inverse is `xyzToXyy`:

```
>>> [0.20654 0.12197 0.05137].xyzToXyy
[0.54370 0.32108 0.12197]
```

To convert Cie _xy_ chromaticity coordinates to _xyz_ set _Y_ to `one`:

```
>>> [0.54370 0.32108 1].xyyToXyz
[1.69334 1 0.42116]
```

White point in _Srgb_ space:

```
>>> let xyy = [0.3127 0.3290 1];
>>> let xyz = xyy.xyyToXyz;
>>> let rgb = xyz.xyzToRgb.srgbEncode;
>>> (
>>> 	xyz,
>>> 	rgb,
>>> 	rgb.rgbToXyz.xyzToXyy ~ xyy
>>> )
(
	[0.95046 1 1.08906],
	[1 1 1],
	true
)
```

* * *

See also: Colour, Rgb, rgbToXyz, Srgb, srgbEncode, xyzToxyy

Guides: Colour Functions

References:
_Python_
[1](https://colour.readthedocs.io/en/latest/generated/colour.xyY_to_XYZ.html)

Categories: Colour
