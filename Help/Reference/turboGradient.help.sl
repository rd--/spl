# turboGradient

- _turboGradient(aNumber)_

A polynomial approximation for the _Turbo_ color gradient.

Calculate and plot a thirty-two place approximation of the _Turbo_ colour gradient:

~~~spl svg=A
ColourGradient(
	(0 -- 1).discretize(32).collect(
		turboGradient:/1
	),
	nil
)
~~~

![](sw/spl/Help/Image/turboGradient-A.svg)

* * *

See also: ColourGradient, colourGradients, cubeHelix, quilezGradient

Guides: Colour Functions

