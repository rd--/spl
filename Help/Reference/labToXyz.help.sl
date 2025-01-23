# labToXyz

- _labToXyz(xyz)_
- _labToXyz(xyz, whiteReference)_

Convert from Cie _L*a*b*_ colourspace to Cie _Xyz_ tristimulus values _(0,1)_.
_L_ is in _(0,100)_ and _a_ and _b_ are unbounded but ordinarily in _(-100,100)_.

With default (D65) white reference:

```
>>> [69.4695 -48.0439 57.1259]
>>> .labToXyz
[0.25 0.40 0.10]

>>> [50 10 -5]
>>> .labToXyz
[0.19419 0.18419 0.22816]

>>> [41.52788 52.63858 26.92318]
>>> .labToXyz
[0.20655 0.12197 0.05136]
```

With specified (D50) white references:

```
>>> let d50 = [96.4212 100 82.5188];
>>> [50 10 -5]
>>> .labToXyz(d50)
[0.196989 0.184187 0.172917]
```

Inverse is `xyzToLab`:

```
>>> [0.25 0.40 0.10]
>>> .xyzToLab
[69.4695 -48.0439 57.1259]

>>> [0.20655 0.12197 0.05136]
>>> .xyzToLab
[41.52788 52.63858 26.92318]

>>> let d50 = [96.4212 100 82.5188];
>>> [0.196989 0.184187 0.172917]
>>> .xyzToLab(d50)
[50 10 -5]
```

A 9×9 gradient over a subset of _L*a*b*_ colour space at _L*=50_,
with out of gamut values clipped:

~~~spl svg=A
let n = 9;
let u = (-50 -- 50).discretize(n);
{ :i :j |
	[50, i * 1.3, j]
	.labToXyz
	.xyzToRgb
	.clip(0, 1)
	.srgbEncode
}
.table(u, u)
.arrayPlot
~~~

![](sw/spl/Help/Image/labToXyz-A.svg)

A slice of the _L*a*b*_ colour space at _L*=75_,
where `Image` replaces out of gamut colours with _transparent_:

~~~spl svg=B
let n = 100;
let u = (-100 -- 100).discretize(n);
{ :i :j |
	[75, j, i]
	.labToXyz
	.xyzToRgb
	.srgbEncode
}
.table(u.negated, u)
.Image
~~~

![](sw/spl/Help/Image/labToXyz-B.png)

* * *

See also: Colour, luvToXyz, xyzToLab

Guides: Colour Functions

References:
_Mathworks_
[1](https://mathworks.com/help/images/ref/lab2xyz.html),
_Python_
[1](https://colour.readthedocs.io/en/latest/generated/colour.Lab_to_XYZ.html),
_W_
[1](https://en.wikipedia.org/wiki/CIELAB_color_space)
