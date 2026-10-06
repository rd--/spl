# Colour

- _Colour([r g b α=1])_

Answer an `RgbColour` value specified as either the greyscale level _g_,
where `zero` is black and `one` is white,
or as _(r,g,b)_ or _(r,g,b,α)_ parameters.

Threads over lists:

```
>>> [0 0 0; 1 1 1].Colour
[
	RgbColour([0 0 0], 1),
	RgbColour([1 1 1], 1)
]
```

Opaque black:

```
>>> let c = Colour[0 0 0];
>>> (c, c.isBlack)
(RgbColour[0 0 0], true)

>>> 0.greyLevel = Colour[0 0 0]
true
```

Opaque grey:

```
>>> let c = Colour[0.5 0.5 0.5];
>>> (c, c.isGrey)
(RgbColour[0.5 0.5 0.5], true)

>>> 0.5.greyLevel = Colour[0.5 0.5 0.5]
true
```

Opaque white:

```
>>> let c = Colour[1 1 1];
>>> (c, c.isWhite)
(RgbColour[1 1 1], true)

>>> 1.greyLevel = Colour[1 1 1]
true
```

Opaque yellow:

```
>>> let c = Colour[1 1 0];
>>> (c, c.isYellow)
(RgbColour[1 1 0], true)
```

With `alpha` channel:

```
>>> Colour[0.1 0.2 0.3 0.4]
RgbColour([0.1 0.2 0.3], 0.4)
```

At list of `Fraction` values:

```
>>> Colour[1/3 1/5 1/7]
RgbColour([1/3 1/5 1/7], 1)
```

At `RgbColour` answer `identity`:

```
>>> 1.red.Colour
RgbColour([1 0 0], 1)
```

At `Nil` answer black with α=0,
a transparent colour:

```
>>> nil.Colour
RgbColour([0, 0, 0], 0)
```

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

![](Help/Image/Colour-A.svg)

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
>>> RgbColour[0 0 0].isBlack
true
```

Is colour white predicate:

```
>>> RgbColour[1 1 1].isWhite
true
```

Is colour grey with particular value:

```
>>> RgbColour[0.5 0.5 0.5]
>>> .isGreyOf(0.5)
true
```

Is colour grey predicate:

```
>>> RgbColour[0.5 0.5 0.5].isGrey
true
```

Is colour red predicate:

```
>>> RgbColour[1 0.2 0.2].isRed
true
```

Is colour green predicate:

```
>>> RgbColour[0.2 1 0.2].isGreen
true
```

Is colour blue predicate:

```
>>> RgbColour[0.2 0.2 1].isBlue
true
```

Is colour yellow predicate:

```
>>> RgbColour[0.9 0.75 0].isYellow
true
```

Is colour cyan predicate:

```
>>> RgbColour[0 0.75 0.9].isCyan
true
```

Is colour magenta predicate:

```
>>> RgbColour[0.9 0 0.75].isMagenta
true
```

Copy colour and mutate components:

```
>>> let c = RgbColour([1 0 0], 0.5);
>>> let z = c.copy;
>>> z.rgb := [1 1 0];
>>> (c != z, c.isRed, z)
(true, true, RgbColour([1 1 0], 0.5))
```

A blue colour patch:

~~~spl svg=B
Colour[0.2 0.5 0.7]
~~~

![](Help/Image/Colour-B.svg)

A light grey colour patch:

~~~spl svg=C
Colour[0.75 0.75 0.75]
~~~

![](Help/Image/Colour-C.svg)

* * *

See also: HsvColour, RgbColour, alpha, blue, green, greyLevel, red

Guides: Colour Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RGBColor.html),
_W_
[1](https://en.wikipedia.org/wiki/Color)

Categories: Colour, Type
