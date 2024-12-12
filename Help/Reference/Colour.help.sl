# Colour

- _Colour(red, green, blue, alpha)_

The `Type` representing a colour with three colour component channels and an _alpha_ channel indicating transparency (or opacity).

Parse colour from hash-prefixed hexadecimal string:

```
>>> '#f97306'.parseHexColour
Colour(
	16rf9 / 255,
	16r73 / 255,
	16r06 / 255
)
```

Colour as hash-prefixed hexadecimal string:

```
>>> Colour(
>>> 	16rf9 / 255,
>>> 	16r73 / 255,
>>> 	16r06 / 255
>>> ).hexString
'#f97306'
```

There are a number of colour predicates:

Is colour black:

```
>>> Colour(0, 0, 0).isBlack
true
```

Is colour white:

```
>>> Colour(1, 1, 1).isWhite
true
```

Is colour grey with particular value:

```
>>> Colour(0.5, 0.5, 0.5).isGreyOf(0.5)
true
```

Is colour grey:

```
>>> Colour(0.5, 0.5, 0.5).isGrey
true
```

Is colour red:

```
>>> Colour(1, 0.2, 0.2).isRed
true
```

Is colour green:

```
>>> Colour(0.2, 1, 0.2).isGreen
true
```

Is colour blue:

```
>>> Colour(0.2, 0.2, 1).isBlue
true
```

Is colour yellow:

```
>>> Colour(0.9, 0.75, 0).isYellow
true
```

Is colour cyan:

```
>>> Colour(0, 0.75, 0.9).isCyan
true
```

Is colour magenta:

```
>>> Colour(0.9, 0, 0.75).isMagenta
true
```

* * *

See also: alpha, blue, green, Hsv, red

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RGBColor.html)

Categories: Colour, Type
