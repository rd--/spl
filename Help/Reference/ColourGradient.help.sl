# ColourGradient

- _ColourGradient([c₁ c₂ …], [p₁ p₂ …])_

A `Type` holding a colour gradient.
A colour gradient is a list of colours and a corresponding list of positions in the range _(0,1)_.
If the position list is `nil` it is understood to an equally spaced gradient.

The `size` of a colour gradient is the number of colours,
or equally the numer of positions.

Plot the _Pastel_ gradient,
from the _Mathematica_ collection of the `colourGradients` library,
resampled to thirty-two places:

~~~spl svg=A
system.colourGradients[
	'Mathematica',
	'Pastel'
].asColourGradient
.resample(32)
~~~

![](sw/spl/Help/Image/ColourGradient-A.svg)

The method `namedColourGradient` answers a `ColourGradient` value:

~~~spl svg=B
'Kovesi/Linear-Bmy-10-95-C78'
.namedColourGradient
.resample(24)
~~~

![](sw/spl/Help/Image/ColourGradient-B.svg)

* * *

See also: asColourGradient, asContinuousColourGradient, asDiscreteColourGradient, colourGradients, Colour, ColourPalette, namedColourGradient, resample

Guides: Colour Functions
