# colourPalettes

- _colourPalettes(system)_

Answer a collection of colour palettes collated from a variety of sources.
The collection is keyed firstly by the collection name,
and secondly by the palette name.
Items are _(r, g, b)_ triples in _(0, 1)_.

Count collections:

```
>>> system.colourPalettes.size
13
```

Count palettes:

```
>>> system
>>> .colourPalettes
>>> .collect(size:/1)
>>> .sum
294
```

Plot the nine colour _Set1_ palette from the _ColorBrewer_ collection using `arrayPlot`:

~~~spl svg=A
system
.colourPalettes[
	'ColorBrewer',
	'Set1'
]
.enclose
.arrayPlot
~~~

![](sw/spl/Help/Image/colourPalettes-A.svg)

Plot the six colour _Charmonix_ palette from the _NationalParks_ collection:

~~~spl svg=B
system
.colourPalettes[
	'NationalParks',
	'Charmonix'
]
.enclose
.arrayPlot
~~~

![](sw/spl/Help/Image/colourPalettes-B.svg)

Plot the four colour _Fernande_ palette from the _Ltc_ collection:

~~~spl svg=C
system
.colourPalettes['Ltc', 'Fernande']
.enclose
.arrayPlot
~~~

![](sw/spl/Help/Image/colourPalettes-C.svg)

Plot the nine colour _Jewel Bright_ palette from the _Tableau_ collection:

~~~spl svg=D
system
.colourPalettes['Tableau', 'Jewel Bright']
.enclose
.arrayPlot
~~~

![](sw/spl/Help/Image/colourPalettes-D.svg)

`asDiscreteColourGradient` translates a _colour palette_ to a `ColourGradient`,
arranged to have discrete sections.
Plot the discrete gradient of the four colour _Fernande_ palette from the _Ltc_ collection:

~~~spl svg=E
system
.colourPalettes['Ltc', 'Fernande']
.asDiscreteColourGradient
~~~

![](sw/spl/Help/Image/colourPalettes-E.svg)

`asContinuousColourGradient` translates a _colour palette_ to a `ColourGradient`,
arranged to be a continous gradient with equally spaced positions.
Plot the continuous gradient of the four colour _Fernande_ palette from the _Ltc_ collection:

~~~spl svg=F
system
.colourPalettes['Ltc', 'Fernande']
.asContinuousColourGradient
~~~

![](sw/spl/Help/Image/colourPalettes-F.svg)

Sources for each collection:
_Carto_: [1](https://github.com/Nowosad/rcartocolor),
_ColorBrewer_: [1](https://colorbrewer2.org) [2](https://cran.r-project.org/web/packages/RColorBrewer/),
_Crameri_: [1](https://www.fabiocrameri.ch/colourmaps),
_Excel_: [1](https://jrnold.github.io/ggthemes/reference/excel_new_pal.html),
_LaCroix_: [1](https://github.com/johannesbjork/LaCroixColoR),
_Ltc_: [1](https://github.com/loukesio/ltc-color-palettes),
_NationalParks_: [1](https://github.com/kevinsblake/NatParksPalettes),
_OkabeIto_: [1](https://jfly.uni-koeln.de/color/),
_Pals_: [1](https://github.com/kwstat/pals/),
_Tableau_: [1](https://jrnold.github.io/ggthemes/reference/tableau_color_pal.html),
_Tol_: [1](https://personal.sron.nl/~pault/data/colourschemes.pdf),
_WallStreetJournal_: [1](https://jrnold.github.io/ggthemes/reference/wsj_pal.html),
_Wehrwein_: [1](https://github.com/awhstin/awtools)

_Note:_
The colour palettes catalogue is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: asContinuousColourGradient, asDiscreteColourGradient, colourGradients, Colour, ColourGradient, RgbColour

Guides: Colour Functions, Library Catalogue
