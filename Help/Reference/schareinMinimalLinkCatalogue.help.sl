# schareinMinimalLinkCatalogue

- _schareinMinimalLinkCatalogue(system)_

This is the minimal configuration data for the knots at `schareinKnotCatalogue`.

Count the number of entries:

```
>>> system
>>> .schareinMinimalLinkCatalogue
>>> .size
130
```

Draw the entry for the link _3-1_,
the first (and only) three crossing knot in the catalogue,
using an _xy_ projection:

~~~spl svg=A
system
.schareinMinimalLinkCatalogue
.at('6-2-1')
.collect { :each |
	each.columns([1 2]).closedLine
}
.LineDrawing
~~~

![](sw/spl/Help/Image/schareinMinimalLinkCatalogue-A.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

The `schareinMinimalLinkCatalogue` method is `requireLibraryItem` of 'SchareinMinimalKnotCatalogue'.

* * *

See also: Line, schareinKnotCatalogue, schareinMinimalKnotCatalogue

Guides: Library Catalogue

References:
_W_
[1](https://en.wikipedia.org/wiki/Knot_(mathematics))

Further Reading: Rolfsen 1976
