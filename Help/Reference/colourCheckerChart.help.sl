# colourCheckerChart

- _colourCheckerChart(aSystem)_

Answer a `Record` of named _Rgb_ colours,
colours are answered as _(r,g,b)_ triples.

Count entries:

```
>>> system.colourCheckerChart.size
24
```

Colour names:

```
>>> system
>>> .colourCheckerChart
>>> .keys
>>> .reshape([4 6])
[
	'Dark skin' 'Light skin'
	'Blue sky' 'Foliage'
	'Blue flower' 'Bluish green'
	;
	'Orange' 'Purplish blue'
	'Moderate red' 'Purple'
	'Yellow green' 'Orange yellow'
	;
	'Blue' 'Green' 'Red'
	'Yellow' 'Magenta' 'Cyan'
	;
	'White' 'Neutral 8' 'Neutral 6.5'
	'Neutral 5' 'Neutral 3.5' 'Black'
]
```

Lookup and draw entry:

~~~spl svg=A
system
.colourCheckerChart
.at('Bluish green')
.asColour
~~~

![](sw/spl/Help/Image/colourCheckerChart-A.svg)

Plot colour checker chart:

~~~spl svg=A
system
.colourCheckerChart
.values
.reshape([4 6 3])
.arrayPlot
~~~

![](sw/spl/Help/Image/colourCheckerChart-B.svg)

_Note:_
The chart is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: Colour, LibraryItem, parseHexColour, parseHexTriplet, RgbColour

References:
_W_
[1](https://en.wikipedia.org/wiki/ColorChecker)
