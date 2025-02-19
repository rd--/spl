# colourGradients

- _colourGradients(aSystem)_

Answer a collection of colour gradients collated from a variety of sources.
The collection is keyed firstly by the collection name,
and secondly by the palette name.
Items are _(colourList, positionList)_ pairs.

Count collections:

```
>>> system.colourGradients.size
199
```

Count gradients:

```
>>> system
>>> .colourGradients
>>> .collect(size:/1)
>>> .sum
4888
```

Plot the three colour _bhw1\_01_ gradient from the _bhw\_bhw1_ collection:

~~~spl svg=A
system
.colourGradients['bhw_bhw1', 'bhw1_01']
.asColourGradient
.colourList
.enclose
.arrayPlot
~~~

![](sw/spl/Help/Image/colourGradients-A.svg)

* * *

See also: asColourGradient, colourPalettes, Colour, ColourGradient, RgbColour

Guides: Colour Functions
