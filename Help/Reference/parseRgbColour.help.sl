# parseRgbColour

- _parseRgbColour(aString)_

Parse a Css and Svg format _rgb_ colour string.
Note that the answer is an `Srgb` value, not an `Rgb` value.

```
>>> let c = 'rgb(152,236,232)'.parseRgbColour;
>>> (c, c.rgbString, c.hexString)
(
	Srgb([152 236 232] / 255, 1),
	'rgb(152,236,232)',
	'#98ece8'
)
```

* * *

See also: Colour, parseHexColour, rgbString, Srgb

Guides: Colour Functions

Categories: Colour, Parsing
