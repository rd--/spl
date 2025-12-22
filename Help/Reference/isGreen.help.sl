# isGreen

- _isGreen(c)_

A predicate to decide if the colour _c_ is green.

Select entries from the Svg colour catalogue that are green:

```
>>> system.svgColourCatalogue
>>> .select(isGreen:/1)
>>> .keys
[
	'chartreuse'
	'darkgreen'
	'forestgreen'
	'green'
	'greenyellow'
	'lawngreen'
	'lightgreen'
	'lime'
	'limegreen'
	'mediumspringgreen'
	'palegreen'
	'springgreen'
]
```

Plot colours:

~~~spl svg=A
system.svgColourCatalogue
.select(isGreen:/1)
.values
.reshape([2 6 3]).arrayPlot
~~~

![](sw/spl/Help/Image/isGreen-A.svg)

Svg colours with _green_ in the name that are not selected:

~~~spl svg=B
'Svg'.namedColour(
[
		'DarkOliveGreen'
		'DarkSeaGreen'
		'LightSeaGreen'
		'MediumSeaGreen'
		'SeaGreen'
		'YellowGreen'
	]
).enclose.arrayPlot
~~~

![](sw/spl/Help/Image/isGreen-B.svg)

* * *

See also: isBlue, isRed, isYellow

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Green)
