# parseRgbColour

- _parseRgbColour(aString)_

Parse a subset of the _Css_ and _Svg_ format _rgb_ colour notation.
Note that the answer is an `Srgb` value, the inverse is `rgbString`.

```
>>> let s = 'rgb(152,236,232)';
>>> let c = s.parseRgbColour;
>>> (c, c.rgbString, c.hexString)
(
	Srgb([152 236 232] / 255, 1),
	'rgb(152,236,232)',
	'#98ece8'
)
```

Draw parsed colour:

~~~spl svg=A
'rgb(135,206,235)'.parseRgbColour
~~~

![](sw/spl/Help/Image/parseRgbColour-A.svg)

* * *

See also: Colour, parseHexColour, Rgb, rgbString, Srgb

Guides: Colour Functions

References:
_W3_
[1](https://drafts.csswg.org/css-color/#rgb-functions)
[2](https://www.w3.org/TR/SVGColor12/#sRGBcolor)

Categories: Colour, Parsing
