# Hsv

- _Hsv(hue, saturation, value)_

Answer a `Colour` value given _hue_, _saturation_ and _value_, all in _(0,1)_.
Hsv is a cylindrical-coordinate representations of points in an Rgb color model.

~~~spl svg=A
Hsv(1 / 3, 1 / 4, 1)
~~~

![](sw/spl/Help/Image/Hsv-A.svg)

Value of `zero` is black:

```
>>> Hsv(
>>> 	(0 -- 1).atRandom,
>>> 	(0 -- 1).atRandom,
>>> 	0
>>> ).isBlack
true
```

Saturation of `zero` is grey:

```
>>> Hsv(
>>> 	(0 -- 1).atRandom,
>>> 	0,
>>> 	(0 -- 1).atRandom
>>> ).isGrey
true
```

Saturation of `zero` and value of `one` is white:

```
>>> Hsv(
>>> 	(0 -- 1).atRandom,
>>> 	0,
>>> 	1
>>> ).isWhite
true
```

Colour predicates (s=1 & v=1):

```
>>> Hsv(0 / 360, 1, 1).isRed
true

>>> Hsv(120 / 360, 1, 1).isGreen
true

>>> Hsv(240 / 360, 1, 1).isBlue
true

>>> Hsv(60 / 360, 1, 1).isYellow
true

>>> Hsv(180 / 360, 1, 1).isCyan
true

>>> Hsv(300 / 360, 1, 1).isMagenta
true
```

At specific values:

```
>>> Hsv(251.5 / 360, 0.887, 0.918)
Colour(0.25980, 0.10374, 0.918)
```

* * *

See also: Colour, hsvToRgb

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Hue.html),
_W_
[1](https://en.wikipedia.org/wiki/HSL_and_HSV)

Further Reading: Joblove 1978

Categories: Colour, Graphics
