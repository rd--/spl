# isGrey

- _isGrey(c)_

A predicate to decide if the colour _c_ is grey.

Select entries from the Svg colour catalogue that are grey:

```
>>> system.svgColourCatalogue
>>> .select(isGrey:/1)
>>> .keys
[
	'darkgray'
	'darkgrey'
	'dimgray'
	'dimgrey'
	'gainsboro'
	'gray'
	'grey'
	'lightgray'
	'lightgrey'
	'silver'
	'whitesmoke'
]
```

Plot colours,
deleting duplicates:

~~~spl svg=A
system.svgColourCatalogue
.select(isGrey:/1)
.values
.deleteDuplicates
.enclose.arrayPlot
~~~

![](sw/spl/Help/Image/isGrey-A.svg)

* * *

See also: isBlue, isGreen, isRed, isYellow

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Grey)
