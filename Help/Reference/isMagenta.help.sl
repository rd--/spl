# isMagenta

- _isMagenta(c)_

A predicate to decide if the colour _c_ is magenta.

Select entries from the Svg colour catalogue that are magenta:

```
>>> system.svgColourCatalogue
>>> .select(isMagenta:/1)
>>> .keys
[
	'darkmagenta'
	'darkviolet'
	'fuchsia'
	'magenta'
	'purple'
]
```

Plot colours,
not that the colours called 'Fuchsia' and 'Magenta' are the same:

~~~spl svg=A
system.svgColourCatalogue
.select(isMagenta:/1)
.values
.enclose.arrayPlot
~~~

![](sw/spl/Help/Image/isMagenta-A.svg)

* * *

See also: isBlue, isGreen, isRed, isYellow

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Magenta)
