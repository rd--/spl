# svgColourCatalogue

- _svgColourCatalogue(aSystem)_

The Svg colour catalogue is a collection of named colours from the Svg 1.1 specification.

Count the entries:

```
>>> system.svgColourCatalogue.size
147
```

The colours are `SrgbColour` values:

```
>>> system
>>> .svgColourCatalogue
>>> .anyOne
>>> .isSrgbColour
true
```

Lookup a colour:

```
>>> system
>>> .svgColourCatalogue['powderblue']
>>> .rgbString
'rgb(176,224,230)'
```

Display a 13×13 table of all of the colours,
the end of the table recycles earlier colours:

~~~spl svg=A
system
.svgColourCatalogue
.values
.reshape([13 13])
.deepCollect(rgb:/1)
.arrayPlot
~~~

![](sw/spl/Help/Image/svgColourCatalogue-A.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

The `svgColourCatalogue` method is `requireLibraryItem` of 'SvgColourCatalogue'.

* * *

See also: Colour, LibraryItem, Srgb

Guides: Colour Functions

References:
_W3_
[1](https://www.w3.org/TR/SVG11/types.html#ColorKeywords)

Categories: Colour
