# asColourGradient

- _asColourGradient([c₁ c₂ …; p₁ p₂ …])_

Answer a `ColourGradient` having the specified colours _c_ and and positions _p_.

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
