# parseRgbColour

- _parseRgbColour(s)_

Parse a subset of the _Css_ and _Svg_ format _rgb_ colour notation.
The answer is an `RgbColour` value,
in the ordinary case the value is in the _Srgb_ colour space.
The inverse is `rgbString`.

```
>>> let s = 'rgb(152,236,232)';
>>> let c = s.parseRgbColour;
>>> (c, c.rgbString, c.hexTriplet)
(
	RgbColour([152 236 232] / 255, 1),
	'rgb(152,236,232)',
	'#98ECE8'
)
```

Draw parsed colour:

~~~spl svg=A
'rgb(135,206,235)'.parseRgbColour
~~~

![](sw/spl/Help/Image/parseRgbColour-A.svg)

* * *

See also: Colour, parseHexColour, parseRgbTriplet, RgbColour, rgbString

Guides: Colour Functions, Parsing Functions

References:
_W3_
[1](https://drafts.csswg.org/css-color/#rgb-functions)
[2](https://www.w3.org/TR/SVGColor12/#sRGBcolor)

Categories: Colour, Parsing
