# ColourGradient

- _ColourGradient(colourList, positionList)_

A `Type` holding a colour gradient.
A colour gradient is a list of colours and a corresponding list of positions in the range _(0, 1)_.

The `size` of a colour gradient is the number of colours,
or equally the numer of positions.

Plot the _pastel_ gradient,
from the _mathematica_ collection of the `colourGradients` library,
resampled to thirty-two places:

~~~
system.colourGradients[
	'mathematica',
	'pastel'
].asColourGradient
.resample(32)
~~~

![](sw/spl/Help/Image/ColourGradient-A.svg)

* * *

See also: asColourGradient, asContinuousColourGradient, asDiscreteColourGradient, colourGradients, Colour, resample
