# asColourGradient

- _asColourGradient([colourList, positionList])_

Answer a `ColourGradient` having the specified colour and position lists.

Answer a yellow-magenta-blue gradient with the magenta positioned at two-thirds:

~~~spl svg=A
[
	[
		1 1 0;
		1 0 1;
		0 0 1
	],
	[
		0 0.66 1
	]
].asColourGradient
~~~

![](sw/spl/Help/Image/asColourGradient-A.svg)

* * *

See also: asContinuousColourGradient, asDiscreteColourGradient, Colour, ColourGradient, colourGradients, colourPalettes

Guides: Colour Functions
