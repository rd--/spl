# isBlue

- _isBlue(c)_

A predicate to decide if the colour _c_ is blue.

Select entries from the Svg colour catalogue that are blue:

```
>>> system.svgColourCatalogue
>>> .select(isBlue:/1)
>>> .keys
[
	'blue'
	'blueviolet'
	'cornflowerblue'
	'darkblue'
	'mediumblue'
	'mediumslateblue'
	'midnightblue'
	'navy'
	'royalblue'
	'slateblue'
]
```

Plot colours:

~~~spl svg=A
system.svgColourCatalogue
.select(isBlue:/1)
.values
.reshape([2 5 3]).arrayPlot
~~~

![](sw/spl/Help/Image/isBlue-A.svg)

Svg colours with _blue_ in the name that are not selected:

~~~spl svg=B
'Svg'.namedColour(
[
		'AliceBlue'
		'CadetBlue'
		'DarkSlateBlue'
		'DeepskyBlue'
		'DodgerBlue'
		'LightBlue'
		'LightSkyBlue'
		'LightSteelBlue'
		'PowderBlue'
		'RoyalBlue'
		'SlateBlue'
		'SteelBlue'
	]
).reshape([2 6]).arrayPlot
~~~

![](sw/spl/Help/Image/isBlue-B.svg)

* * *

See also: isGreen, isRed, isYellow

Guides: Colour Functions
