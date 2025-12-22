# isCyan

- _isCyan(c)_

A predicate to decide if the colour _c_ is cyan.

Select entries from the Svg colour catalogue that are cyan:

```
>>> system.svgColourCatalogue
>>> .select(isCyan:/1)
>>> .keys
[
	'aqua'
	'cyan'
	'darkcyan'
	'darkturquoise'
	'teal'
]
```

Plot colours,
not that the colours called 'Aqua' and 'Cyan' are the same:

~~~spl svg=A
system.svgColourCatalogue
.select(isCyan:/1)
.values
.enclose.arrayPlot
~~~

![](sw/spl/Help/Image/isCyan-A.svg)

* * *

See also: isBlue, isGreen, isRed, isYellow

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Cyan)
