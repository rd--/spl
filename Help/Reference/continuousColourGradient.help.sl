# continuousColourGradient

- _continuousColourGradient([c₁ c₂ …])_

Answer a `ColourGradient`,
arranged to be a continous gradient of the colour palette at _c_,
with equally spaced positions.

Plot the continuous gradient of the the four colour _Rgby_ palette,
from the _WallStreetJournal_ collection of `colourPalettes`:

~~~spl svg=A
system.colourPalettes
.at('WallStreetJournal')
.at('Rgby')
.continuousColourGradient
~~~

![](Help/Image/continuousColourGradient-A.svg)

The discrete gradient of the same palette,
retrieved using `namedColourPalette`:

~~~spl svg=B
'WallStreetJournal/Rgby'
.namedColourPalette
.discreteColourGradient
~~~

![](Help/Image/continuousColourGradient-B.svg)

* * *

See also: Colour, ColourGradient, colourPalettes, discreteColourGradient, namedColourPalette

Guides: Colour Functions
