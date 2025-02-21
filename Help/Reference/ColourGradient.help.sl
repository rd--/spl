# ColourGradient

- _ColourGradient(colourList, positionList)_

A `Type` holding a colour gradient.
A colour gradient is a list of colours and a corresponding list of positions in the range _(0, 1)_.

The `size` of a colour gradient is the number of colours,
or equally the numer of positions.

Plot the _pastel_ gradient,
from the _mathematica_ collection of the `colourGradients` library,
resampled to thirty-two places:

~~~spl svg=A
system.colourGradients[
	'mathematica',
	'pastel'
].asColourGradient
.resample(32)
~~~

![](sw/spl/Help/Image/ColourGradient-A.svg)

The `namedColourGradient` answers a `ColourGradient` value:

~~~spl svg=B
'kovesi.linear_bmy_10_95_c78'
.namedColourGradient
.resample(24)
~~~

![](sw/spl/Help/Image/ColourGradient-B.svg)

* * *

See also: asColourGradient, asContinuousColourGradient, asDiscreteColourGradient, colourGradients, Colour, namedColourGradient, resample

Guides: Colour Functions
