# svgColourCatalogue

- _svgColourCatalogue(system)_

The Svg colour catalogue is a `Record` of named colours from the Svg 1.1 specification.

Count the entries:

```
>>> system.svgColourCatalogue.size
147
```

The colours are given as _(r,g,b)_ triples, not `RgbColour` values:

```
>>> system
>>> .svgColourCatalogue
>>> .anyOne
>>> .isList
true
```

Lookup a colour,
lookup is case-sensitive and names are given in all lower case:

```
>>> system
>>> .svgColourCatalogue['powderblue']
>>> .asColour
>>> .rgbString
'rgb(176,224,230)'
```

Display a 10×15 table of all of the colours,
the end of the table recycles earlier colours:

~~~spl svg=A
system
.svgColourCatalogue
.values
.reshape([10 15 3])
.arrayPlot
~~~

![](sw/spl/Help/Image/svgColourCatalogue-A.svg)

Sorted lexicographically:

~~~spl svg=B
system
.svgColourCatalogue
.values
.lexicographicSort
.reshape([10 15 3])
.arrayPlot
~~~

![](sw/spl/Help/Image/svgColourCatalogue-B.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

The `svgColourCatalogue` method is `requireLibraryItem` of 'SvgColourCatalogue'.

* * *

See also: asColour, Colour, LibraryItem, namedColour, RgbColour, svgColourDictionary

Guides: Colour Functions, Library Catalogue

References:
_W3_
[1](https://www.w3.org/TR/SVG11/types.html#ColorKeywords)

Categories: Colour
