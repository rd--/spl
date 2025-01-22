# xyyToXyz

- _xyyToXyz(xyy)_

Answer an _(x,y,z)_ triple given an _(x,y,y)_ triple.

At specific value:

```
>>> [0.54370 0.32108 0.12197].xyyToXyz
[0.20654 0.12197 0.05137]

>>> [0.20654 0.12197 0.05137].xyzToXyy
[0.54370 0.32108 0.12197]
```

White point in Rgb space:

```
>>> let xyy = [0.3127 0.3290 1];
>>> let xyz = xyy.xyyToXyz;
>>> let rgb = xyz.xyzToRgb;
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

See also: Colour, xyzToxyy

References:
_Python_
[1](https://colour.readthedocs.io/en/latest/generated/colour.xyY_to_XYZ.html)

