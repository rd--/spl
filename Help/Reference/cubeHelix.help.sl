# cubeHelix

- _cubeHelix(start, rotations, hue, γ)_

`cubeHelix` is a colour mapping that degrades gracefully to greyscale without losing information,
making it useful for continuous colour scales in scientific drawings that may be printed in greyscale.
Answers a one argument `Block` that implements the specified gradient function.

~~~spl svg=A
(0 -- 1).discretize(48).collect(
	cubeHelix(0.5, -1.5, 1.2, 1.0)
).asContinuousColourGradient
~~~

![](sw/spl/Help/Image/cubeHelix-A.svg)

* * *

See also: asContinuousColourGradient, Colour, ColourGradient, quilezGradient, RgbColour

Guides: Colour Functions

Further Reading: Green 2011
