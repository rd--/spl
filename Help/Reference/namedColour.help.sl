# namedColour

- _namedColour(k, c)_

Answer a `Colour` by looking up the colour name _c_ in the colour catalogue _k_.

The binary form is a direct lookup for catalogue name _k_ and colour name _c_:

Lookup _Orange_ in the _Svg_ catalogue:

~~~spl svg=A
'Svg'.namedColour('Orange')
~~~

![](sw/spl/Help/Image/namedColour-A.svg)

Threads over lists:

~~~spl svg=B
'Svg'.namedColour(
	[
		'DarkOrange'
		'Orange'
		'OrangeRed'
	]
).reshape([1 3]).arrayPlot
~~~

![](sw/spl/Help/Image/namedColour-B.svg)

There are many shades of blue:

~~~spl svg=C
'Svg'.namedColour(
	[
		'AliceBlue'
		'Blue'
		'BlueViolet'
		'CadetBlue'
		'CornflowerBlue'
		'DarkBlue'
		'DarkSlateBlue'
		'DeepskyBlue'
		'DodgerBlue'
		'LightBlue'
		'LightSkyBlue'
		'LightSteelBlue'
		'MediumBlue'
		'MediumSlateBlue'
		'MidnightBlue'
		'PowderBlue'
		'RoyalBlue'
		'SkyBlue'
		'SlateBlue'
		'SteelBlue'
	]
).reshape([4 5]).arrayPlot
~~~

![](sw/spl/Help/Image/namedColour-C.svg)

Shades of yellow:

~~~spl svg=D
[
	'Svg/GreenYellow'
	'Svg/LightGoldenrodYellow'
	'Svg/LightYellow'
	'Svg/Yellow'
	'Svg/YellowGreen'
].namedColour.enclose.arrayPlot
~~~

![](sw/spl/Help/Image/namedColour-D.svg)

Shades of red:

~~~spl svg=E
'Svg'.namedColour(
	[
		'DarkRed'
		'IndianRed'
		'MediumVioletRed'
		'OrangeRed'
		'PaleVioletRed'
		'Red'
	]
).enclose.arrayPlot
~~~

![](sw/spl/Help/Image/namedColour-E.svg)

Shades of green:

~~~spl svg=F
'Svg'.namedColour(
	[
		'DarkGreen'
		'DarkOliveGreen'
		'DarkSeaGreen'
		'ForestGreen'
		'Green'
		'GreenYellow'
		'LawnGreen'
		'LightGreen'
		'LightSeaGreen'
		'LimeGreen'
		'MediumSeaGreen'
		'MediumSpringGreen'
		'PaleGreen'
		'SeaGreen'
		'SpringGreen'
		'YellowGreen'
	]
).reshape([3 5]).arrayPlot
~~~

![](sw/spl/Help/Image/namedColour-F.svg)

A rainbow:

~~~spl svg=G
'Svg'.namedColour(
	[
		'Red'
		'Orange'
		'Yellow'
		'Green'
		'Blue'
		'Indigo'
		'Violet'
	]
).enclose.arrayPlot
~~~

![](sw/spl/Help/Image/namedColour-G.svg)

A rainbow from the Crayola catalogue:

~~~spl svg=G
'Crayola'.namedColour(
	[
		'Red'
		'Orange'
		'Yellow'
		'Green'
		'Blue (I)'
		'Indigo'
		'Violet (I)'
	]
).enclose.arrayPlot
~~~

![](sw/spl/Help/Image/namedColour-H.svg)

* * *

See also: Colour, parseHexColour, parseHexTriplet, parseRgbColour

Guides: Colour Functions
