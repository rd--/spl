# HsvColour

- _HsvColour(hsv, alpha)_

Answer an `RgbColour` value given `hue`, `saturation` and `value`, all in _(0,1)_.
`HsvColour` is a cylindrical-coordinate representations of points in an `RgbColour` colour model.

~~~spl svg=A
HsvColour([1/3 1/4 1], 1)
~~~

![](sw/spl/Help/Image/HsvColour-A.svg)

Value of `zero` is black:

```
>>> HsvColour(
>>> 	[
>>> 		(0 -- 1).atRandom,
>>> 		(0 -- 1).atRandom,
>>> 		0
>>> 	],
>>> 	1
>>> ).isBlack
true
```

Saturation of `zero` is grey:

```
>>> HsvColour(
>>> 	[
>>> 		(0 -- 1).atRandom,
>>> 		0,
>>> 		(0 -- 1).atRandom
>>> 	],
>>> 	1
>>> ).isGrey
true
```

Saturation of `zero` and value of `one` is white:

```
>>> HsvColour(
>>> 	[
>>> 		(0 -- 1).atRandom,
>>> 		0,
>>> 		1
>>> 	],
>>> 	1
>>> ).isWhite
true
```

Colour predicates (_s=1_ & _v=1_):

```
>>> HsvColour([0/360 1 1], 1).isRed
true

>>> HsvColour([120/360 1 1], 1).isGreen
true

>>> HsvColour([240/360 1 1], 1).isBlue
true

>>> HsvColour([60/360 1 1], 1).isYellow
true

>>> HsvColour([180/360 1 1], 1).isCyan
true

>>> HsvColour([300/360 1 1], 1).isMagenta
true
```

At specific values:

```
>>> HsvColour(
>>> 	[251.5 / 360, 0.887, 0.918],
>>> 	1
>>> )
RgbColour([0.25980, 0.10374, 0.918], 1)
```

* * *

See also: Colour, hsv, hsvToRgb

Guides: Colour Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Hue.html),
_W_
[1](https://en.wikipedia.org/wiki/HSL_and_HSV)

Further Reading: Joblove 1978, Smith 1978

Categories: Colour, Graphics
