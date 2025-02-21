# cubeHelix

- _cubeHelix(start, rotations, hue, gamma)_

`cubeHelix` is a color mapping that degrades gracefully to grayscale without losing information,
making it useful for continuous color scales in scientific drawings that may be printed in grayscale.

~~~spl svg=A
(0 -- 1).discretize(48).collect(
	cubeHelix(0.5, -1.5, 1.2, 1.0)
).asContinuousColourGradient
~~~

![](sw/spl/Help/Image/cubeHelix-A.svg)

* * *

See also: asContinuousColourGradient, Colour, ColourGradient, quilezGradient, RgbColour

Further Reading: Green 2011
