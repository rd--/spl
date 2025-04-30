# schareinMinimalKnotCatalogue

- _schareinMinimalKnotCatalogue(aSystem)_

This is the minimal configuration data for the knots at `schareinKnotCatalogue`.

Count the number of entries:

```
>>> system
>>> .schareinMinimalKnotCatalogue
>>> .size
250
```

Draw the entry for the knot _3-1_,
the first (and only) three crossing knot in the catalogue,
using an _xy_ projection:

~~~spl svg=A
system
.schareinMinimalKnotCatalogue
.at('3-1')
.columns(1:2)
.closedLine
.asLineDrawing
~~~

![](sw/spl/Help/Image/schareinMinimalKnotCatalogue-A.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

The `schareinMinimalKnotCatalogue` method is `requireLibraryItem` of 'SchareinMinimalKnotCatalogue'.

* * *

See also: Line, schareinKnotCatalogue, schareinMinimalLinkCatalogue

References:
_W_
[1](https://en.wikipedia.org/wiki/Knot_(mathematics))

Further Reading: Rolfsen 1976
