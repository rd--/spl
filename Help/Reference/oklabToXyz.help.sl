# oklabToXyz

- _oklabToXyz(oklab)_

Convert from _Oklab_ colourspace to Cie _Xyz_ tristimulus values.
_L_ is in _(0,1)_ and _a_ and _b_ are unbounded but ordinarily in _(-0.5,0.5)_.

```
>>> [0.516340 0.154695 0.062896]
>>> .oklabToXyz
[0.2065400 0.1219723 0.0513695]
```

Inverse is `xyzToOklab`:

```
>>> [0.2065400 0.1219723 0.0513695]
>>> .xyzToOklab
[0.516340 0.154695 0.062896]
```

A 9×9 gradient over a subset of _Oklab_ colour space at _L=0.75_,
with out of gamut values clipped:

~~~spl svg=A
let n = 9;
let u = (-0.125 -- 0.125).discretize(n);
{ :i :j |
	[0.75, i, j]
	.oklabToXyz
	.xyzToRgb
	.clip([0 1])
	.srgbEncode
}
.table(u, u)
.arrayPlot
~~~

![](sw/spl/Help/Image/oklabToXyz-A.svg)

A slice of the _Oklab_ colour space at _L=0.75_,
where `Image` replaces out of gamut colours with _transparent_:

~~~spl png=B
let n = 100;
let u = (-0.25 -- 0.25).discretize(n);
{ :i :j |
	[0.75, j, i]
	.oklabToXyz
	.xyzToRgb
	.srgbEncode
}
.table(u.negated, u)
.Image
~~~

![](sw/spl/Help/Image/oklabToXyz-B.png)

* * *

See also: Colour, labToXyz, xyzToOklab

Guides: Colour Functions

References:
_Python_
[1](https://colour.readthedocs.io/en/develop/generated/colour.Oklab_to_XYZ.html),
_W_
[1](https://en.wikipedia.org/wiki/Oklab_color_space)
