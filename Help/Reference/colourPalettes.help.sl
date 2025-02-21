# colourPalettes

- _colourPalettes(aSystem)_

Answer a collection of colour palettes collated from a variety of sources.
The collection is keyed firstly by the collection name,
and secondly by the palette name.
Items are _(r, g, b)_ triples in _(0, 1)_.

Count collections:

```
>>> system.colourPalettes.size
250
```

Count palettes:

```
>>> system
>>> .colourPalettes
>>> .collect(size:/1)
>>> .sum
6371
```

Plot the nine colour _Set1_ palette from the _RColorBrewer_ collection:

~~~spl svg=A
system
.colourPalettes['RColorBrewer', 'Set1']
.enclose
.arrayPlot
~~~

![](sw/spl/Help/Image/colourPalettes-A.svg)

Plot the six colour _Charmonix_ palette from the _NatParksPalettes_ collection:

~~~spl svg=B
system
.colourPalettes[
	'NatParksPalettes',
	'Charmonix'
]
.enclose
.arrayPlot
~~~

![](sw/spl/Help/Image/colourPalettes-B.svg)

Plot the four colour _fernande_ palette from the _ltc_ collection:

~~~spl svg=C
system
.colourPalettes['ltc', 'fernande']
.enclose
.arrayPlot
~~~

![](sw/spl/Help/Image/colourPalettes-C.svg)

Plot the five colour _cw1-013_ palette from the _cw\_1_ collection:

~~~spl svg=D
system
.colourPalettes['cw_1', 'cw1-013']
.enclose
.arrayPlot
~~~

![](sw/spl/Help/Image/colourPalettes-D.svg)

`asDiscreteColourGradient` translates a _colour palette_ to a `ColourGradient`,
arranged to have discrete sections.
Plot the discrete gradient of the four colour _fernande_ palette from the _ltc_ collection:

~~~spl svg=E
system
.colourPalettes['ltc', 'fernande']
.asDiscreteColourGradient
~~~

![](sw/spl/Help/Image/colourPalettes-E.svg)

`asContinuousColourGradient` translates a _colour palette_ to a `ColourGradient`,
arranged to be a continous gradient with equally spaced positions.
Plot the continuous gradient of the four colour _fernande_ palette from the _ltc_ collection:

~~~spl svg=F
system
.colourPalettes['ltc', 'fernande']
.asContinuousColourGradient
~~~

![](sw/spl/Help/Image/colourPalettes-F.svg)

* * *

See also: asContinuousColourGradient, asDiscreteColourGradient, colourGradients, Colour, ColourGradient, RgbColour

Guides: Colour Functions
