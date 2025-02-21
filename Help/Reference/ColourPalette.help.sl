# ColourPalette

- _ColourPalette(aList)_

A `Type` representing a colour palette.

A colour palette specifed in _Hex-Triplet_ notation:

~~~spl svg=A
[
	'#D3BA68'
	'#D5695D'
	'#5D8CA8'
	'#65A479'
]
.collect(parseHexTriplet:/1)
.ColourPalette
~~~

![](sw/spl/Help/Image/ColourPalette-A.svg)

The `namedColourPalette` method answers a `ColourPalette` value:

~~~spl svg=B
'Superfishel_Stone'.namedColourPalette
~~~

![](sw/spl/Help/Image/ColourPalette-B.svg)

* * *

See also: Colour, ColourGradient, colourPalettes, namedColourPalette, RgbColour

Guides: Colour Functions
