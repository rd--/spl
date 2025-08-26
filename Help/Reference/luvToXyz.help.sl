# luvToXyz

- _luvToXyz(luv)_
- _luvToXyz(luv, whiteReference)_

Convert from Cie _L*u*v*_ colourspace to _Cie Xyz_ tristimulus values.
_L_ is in _(0,100)_ and _a_ and _b_ are unbounded but ordinarily in _(-100,100)_.

Specific values:

```
>>> [41.5288 96.8363 17.7521]
>>> .luvToXyz
[0.206549 0.121978 0.051351]
```

The inverse is `xyzToLuv`:

```
>>> [0.206549 0.121978 0.051351]
>>> .xyzToLuv
[41.5288 96.8363 17.7521]
```

A 9×9 gradient over a subset of _L*u*v*_ colour space at _L*=50_,
with out of gamut values clipped:

~~~spl svg=A
let n = 9;
let u = (-50 -- 50).discretize(n);
{ :i :j |
	[50, i * 1.3, j]
	.luvToXyz
	.xyzToRgb
	.clip([0 1])
	.srgbEncode
}
.table(u, u)
.arrayPlot
~~~

![](sw/spl/Help/Image/luvToXyz-A.svg)

A slice of the _L*u*v*_ colour space at _L*=75_,
where `Image` replaces out of gamut colours with _transparent_:

~~~spl png=B
let n = 100;
let u = (-100 -- 100).discretize(n);
{ :i :j |
	[75, j, i]
	.luvToXyz
	.xyzToRgb
	.srgbEncode
}
.table(u.negate, u)
.Image
~~~

![](sw/spl/Help/Image/luvToXyz-B.png)

* * *

See also: Colour, labToXyz, lchToLuv, xyzToLuv

Guides: Colour Functions

References:
_Python_
[1](https://colour.readthedocs.io/en/develop/generated/colour.Luv_to_XYZ.html),
_W_
[1](https://en.wikipedia.org/wiki/CIELUV)

Categories: Colour
