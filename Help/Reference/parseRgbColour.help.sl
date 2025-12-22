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

A rainbow:

~~~spl svg=B
[
	'rgb(221,0,0)'
	'rgb(254,98,48)'
	'rgb(254,246,0)'
	'rgb(0,187,0)'
	'rgb(0,155,254)'
	'rgb(0,0,131)'
	'rgb(48,0,155)'
].collect(parseRgbColour:/1)
.enclose.arrayPlot
~~~

![](sw/spl/Help/Image/parseRgbColour-B.svg)

* * *

See also: Colour, parseHexColour, parseRgbTriplet, RgbColour, rgbString

Guides: Colour Functions, Parsing Functions

References:
_W3_
[1](https://drafts.csswg.org/css-color/#rgb-functions)
[2](https://www.w3.org/TR/SVGColor12/#sRGBcolor)

Categories: Colour, Parsing
