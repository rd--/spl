# parseHexColour

- _parseHexColour(aString)_

Parse a subset of the _Css_ and _Html_ format hexadecimal colour notation,
answering an `RgbColour` value in _Srgb_ colour space.

```
>>> let c = '#98ece8'.parseHexColour;
>>> (c, c.hexString, c.rgbString)
(
	RgbColour([152 236 232] / 255, 1),
	'#98ece8',
	'rgb(152,236,232)'
)
```

Draw parsed colour:

~~~spl svg=A
'#5F9EA0'.parseHexColour
~~~

![](sw/spl/Help/Image/parseHexColour-A.svg)

* * *

See also: Colour, hexString, parseHexTriplet, parseRgbColour, rgbString, RgbColour

Guides: Colour Functions

Categories: Colour, Parsing
