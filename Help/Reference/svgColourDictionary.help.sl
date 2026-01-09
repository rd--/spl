# svgColourDictionary

- _svgColourDictionary(system)_

A variant of `svgColourCatalogue` where the values are given as `RgbColour` values rather than _(r,g,b)_ triples.

```
>>> system.svgColourDictionary
>>> .size
147

>>> system.svgColourDictionary
>>> .anyOne
>>> .typeOf
'RgbColour'
```

Sort according to `relativeLuminance`,
the sequence is recycled to fill the matrix:

~~~spl svg=A
system.svgColourDictionary
.values
.sortOn(relativeLuminance:/1)
.reshape([10 15])
.arrayPlot
~~~

![](sw/spl/Help/Image/svgColourDictionary-A.svg)

* * *

See also: RgbColour, svgColourCatalogue

Guides: Colour Functions
