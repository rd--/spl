# isRed

- _isRed(c)_

A predicate to decide if the colour _c_ is red.

Select entries from the Svg colour catalogue that are red:

```
>>> system.svgColourCatalogue
>>> .select(isRed:/1)
>>> .keys
[
	'chocolate'
	'coral'
	'crimson'
	'orangered'
	'red'
	'tomato'
]
```

Plot colours:

~~~spl svg=A
system.svgColourCatalogue
.select(isRed:/1)
.values
.enclose.arrayPlot
~~~

![](sw/spl/Help/Image/isRed-A.svg)

Svg colours with _red_ in the name that are not selected:

~~~spl svg=B
'Svg'.namedColour(
	[
		'DarkRed'
		'IndianRed'
		'MediumVioletRed'
		'PaleVioletRed'
	]
).enclose.arrayPlot
~~~

![](sw/spl/Help/Image/isRed-B.svg)

* * *

See also: isBlue, isGreen, isYellow

Guides: Colour Functions
