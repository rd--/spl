# crayolaColourCatalogue

- _crayolaColourCatalogue(system)_

The Crayola colour catalogue is a `Record` of named colours of Crayola drawing crayons.

Count the entries:

```
>>> system.crayolaColourCatalogue.size
163
```

The colours are given as _(r,g,b)_ triples, not `RgbColour` values:

```
>>> system
>>> .crayolaColourCatalogue
>>> .at('Red')
[0.929412 0.039216 0.247059]
```

Lookup a colour,
lookup is case-sensitive and names are given in all lower case:

```
>>> system
>>> .crayolaColourCatalogue
>>> .at('Burnt Umber')
>>> .asColour
>>> .rgbString
'rgb(128,85,51)'
```

Display a 11×15 table of all of the colours,
the end of the table recycles earlier colours:

~~~spl svg=A
system
.crayolaColourCatalogue
.values
.reshape([11 15 3])
.arrayPlot
~~~

![](sw/spl/Help/Image/crayolaColourCatalogue-A.svg)

Sorted by `relativeLuminance`:

~~~spl svg=B
system
.crayolaColourCatalogue
.values
.collect(asColour:/1)
.sortOn(relativeLuminance:/1)
.arrayReshape([11 15], nil)
.arrayPlot
~~~

![](sw/spl/Help/Image/crayolaColourCatalogue-B.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

The `crayolaColourCatalogue` method is `requireLibraryItem` of 'CrayolaColourCatalogue'.

* * *

See also: LibraryItem, namedColour, RgbColour

Guides: Colour Functions, Library Catalogue

References:
_W_
[1](https://en.wikipedia.org/wiki/List_of_Crayola_crayon_colors)

Categories: Colour
