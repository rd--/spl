# asContinuousColourGradient

- _asContinuousColourGradient(aList)_

Answer a `ColourGradient`,
arranged to be a continous gradient of the colour palette at _aList_,
with equally spaced positions.

Plot the continuous gradient of the the four colour _wsj\_rgby_ palette,
from the _ggthemes_ collection of `colourPalettes`:

~~~spl svg=A
system
.colourPalettes['ggthemes', 'wsj_rgby']
.asContinuousColourGradient
~~~

![](sw/spl/Help/Image/asContinuousColourGradient-A.svg)

* * *

See also: asColourGradient, asDiscreteColourGradient, Colour, ColourGradient, colourPalettes

Guides: Colour Functions
