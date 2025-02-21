# asDiscreteColourGradient

- _asDiscreteColourGradient(aList)_

Answer a `ColourGradient`,
arranged to be a discrete gradient of the colour palette at _aList_,
with equally spaced positions.

Plot the discrete gradient of the the nine colour _Set1_ palette,
from the _ColorBrewer_ collection of `colourPalettes`:

~~~spl svg=A
system
.colourPalettes['ColorBrewer', 'Set1']
.asDiscreteColourGradient
~~~

![](sw/spl/Help/Image/asDiscreteColourGradient-A.svg)

* * *

See also: asContinuousColourGradient, Colour, ColourGradient

Guides: Colour Functions
