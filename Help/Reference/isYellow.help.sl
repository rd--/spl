# isYellow

- _isYellow(c)_

A predicate to decide if the colour _c_ is yellow.

Select entries from the Svg colour catalogue that are yellow:

```
>>> system.svgColourCatalogue
>>> .select(isYellow:/1)
>>> .keys
[
	'darkgoldenrod'
	'gold'
	'olive'
	'yellow'
]
```

Plot colours:

~~~spl svg=A
system.svgColourCatalogue
.select(isYellow:/1)
.values
.enclose
.arrayPlot
~~~

![](sw/spl/Help/Image/isYellow-A.svg)

Svg colours with _yellow_ in the name that are not selected:

~~~spl svg=B
'Svg'.namedColour(
	[
		'GreenYellow'
		'LightGoldenrodYellow'
		'LightYellow'
		'YellowGreen'
	]
).enclose.arrayPlot
~~~

![](sw/spl/Help/Image/isYellow-B.svg)

* * *

See also: isBlue, isGreen, isRed

Guides: Colour Functions
