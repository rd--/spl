# Colour

A `Trait` representing colours.
The required methods are `rgb`,
which should answer a _(red, green, blue)_ triple in _(0, 1)_,
and `alpha`,
which should answer a value indicating transparency (or opacity).

Parse colour from hash-prefixed hexadecimal string:

```
>>> let c = '#F97306'.parseHexColour;
>>> (c.rgb, c.alpha)
(
	[
		16rF9 / 255,
		16r73 / 255,
		16r06 / 255
	],
	1
)
```

Colour values can be drawn as swatches:

~~~spl svg=A
'#F97306'.parseHexColour
~~~

![](sw/spl/Help/Image/Colour-A.svg)

Colour as hash-prefixed hexadecimal string:

```
>>> RgbColour(
>>> 	[16rF9 16r73 16r06] / 255,
>>> 	1
>>> )
>>> .hexTriplet
'#F97306'
```

There are a number of colour predicates:

Is colour black predicate:

```
>>> RgbColour([0, 0, 0], 1).isBlack
true
```

Is colour white predicate:

```
>>> RgbColour([1, 1, 1], 1).isWhite
true
```

Is colour grey with particular value:

```
>>> RgbColour([0.5, 0.5, 0.5], 1)
>>> .isGreyOf(0.5)
true
```

Is colour grey predicate:

```
>>> RgbColour([0.5, 0.5, 0.5], 1).isGrey
true
```

Is colour red predicate:

```
>>> RgbColour([1, 0.2, 0.2], 1).isRed
true
```

Is colour green predicate:

```
>>> RgbColour([0.2, 1, 0.2], 1).isGreen
true
```

Is colour blue predicate:

```
>>> RgbColour([0.2, 0.2, 1], 1).isBlue
true
```

Is colour yellow predicate:

```
>>> RgbColour([0.9, 0.75, 0], 1).isYellow
true
```

Is colour cyan predicate:

```
>>> RgbColour([0, 0.75, 0.9], 1).isCyan
true
```

Is colour magenta predicate:

```
>>> RgbColour([0.9, 0, 0.75], 1).isMagenta
true
```

Copy colour and mutate components:

```
>>> let c = RgbColour([1 0 0], 0.5);
>>> let z = c.copy;
>>> z.rgb := [1 1 0];
>>> (c ~= z, c.isRed, z)
(true, true, RgbColour([1 1 0], 0.5))
```

* * *

See also: asColour, alpha, blue, green, Hsv, red

Guides: Colour Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RGBColor.html),
_W_
[1](https://en.wikipedia.org/wiki/Color)

Categories: Colour, Type
