# namedColourPalette

- _namedColourPalette(collectionName, paletteName)_
- _namedColourPalette(paletteName)_

Answer a `ColourPalette` by looking up the `colourPalettes` library.
The binary form is a direct lookup:

Lookup the _Summer_ palette in the _Tableau_ collection:

~~~spl svg=A
'Tableau'.namedColourPalette('Summer')
~~~

![](sw/spl/Help/Image/namedColourPalette-A.svg)

The unary form answers a palettes that are uniquely named across all collections.
Lookup the _Accent_ palette,
which is in the _ColorBrewer_ collection:

~~~spl svg=B
'Accent'.namedColourPalette
~~~

![](sw/spl/Help/Image/namedColourPalette-B.svg)

The unary form allows specifying the collection and palette names separated by a forward slash:

~~~spl svg=C
'NationalParks/Charmonix'
.namedColourPalette
~~~

![](sw/spl/Help/Image/namedColourPalette-C.svg)

* * *

See also: ColourGradient, ColourPalette, colourPalettes

Guides: Colour Guides
