# ncsColourCatalogue

- _ncsColourCatalogue(system)_

Answer a catalogue of _Natural Colour System_ colours.
For each entry the catalogue gives an _(r,g,b)_ triple.

```
>>> system.ncsColourCatalogue
>>> .isRecord
true

>>> system.ncsColourCatalogue
>>> .size
3057
```

Lookup entry:

```
>>> system.ncsColourCatalogue
>>> .at('S 0580-Y10R') * 255
[255 181 0]

>>> system.ncsColourCatalogue
>>> .at('S 5030-G') * 255
[61 108 83]
```

Compare with calculated value:

```
>>> let a = 'NCS S 0580-Y10R'.parseNcs;
>>> let b = a.ncsToRgb;
>>> (b * 255).round
[255 203 33]

>>> let a = 'NCS S 5030-G'.parseNcs;
>>> let b = a.ncsToRgb;
>>> (b * 255).round
[70 135 95]
```

Plot the first 9×30 entries:

~~~spl svg=A
system.ncsColourCatalogue
.values
.reshape([9 30 3])
.arrayPlot
~~~

![](sw/spl/Help/Image/ncsColourCatalogue-A.svg)

Plot the next 13×25 entries:

~~~spl svg=B
system.ncsColourCatalogue
.values
.drop(9 * 30)
.reshape([13 25 3])
.arrayPlot
~~~

![](sw/spl/Help/Image/ncsColourCatalogue-B.svg)

To clear the library item from the cache:

~~~spl cache
system.libraryItem(
	'NcsColourCatalogue'
).clearCache
~~~

_Note_:
The naming is in keeping with `crayolaColourCatalogue`,
that is it is a catalogue of _Natural Colour System_ colours.

* * *

See also: NcsColour, ncsLookup, ncsToRgb, parseNcs

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Natural_Color_System)
