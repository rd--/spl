# parseHexColour

- _parseHexColour(s)_

Parse a subset of the _Css_ and _Html_ format hexadecimal colour notation,
answering an `RgbColour` value in _Srgb_ colour space.

```
>>> let c = '#98ECE8'.parseHexColour;
>>> (c, c.hexTriplet, c.rgbString)
(
	RgbColour([152 236 232] / 255, 1),
	'#98ECE8',
	'rgb(152,236,232)'
)
```

Draw parsed colour:

~~~spl svg=A
'#5F9EA0'.parseHexColour
~~~

![](sw/spl/Help/Image/parseHexColour-A.svg)

A rainbow:

~~~spl svg=B
[
	'#DD0000'
	'#FE6230'
	'#FEF600'
	'#00BB00'
	'#009BFE'
	'#000083'
	'#30009B'
].collect(parseHexColour:/1)
.enclose.arrayPlot
~~~

![](sw/spl/Help/Image/parseHexColour-B.svg)

* * *

See also: Colour, hexTriplet, parseHexTriplet, parseRgbColour, rgbString, RgbColour

Guides: Colour Functions, Parsing Functions

Categories: Colour, Parsing
