# namedColourGradient

- _namedColourGradient(c, g)_
- _namedColourGradient(g)_

Answer a `ColourGradient` by looking up the `colourGradients` library.

The binary form is a direct lookup given the collection name _c_ and the gradient name _g_.

Lookup the _Plasma_ gradient in the _Viridis_ collection:

~~~spl svg=A
'Viridis'.namedColourGradient('Plasma')
.resample(24)
~~~

![](sw/spl/Help/Image/namedColourGradient-A.svg)

The unary form answers a gradients that are uniquely named across all collections.
Lookup the _Isol_ gradient,
which is in the _Niccoli_ collection:

~~~spl svg=B
'Isol'.namedColourGradient.resample(24)
~~~

![](sw/spl/Help/Image/namedColourGradient-B.svg)

The unary form allows specifying the collection and gradient names separated by a forward slash:

~~~spl svg=C
'Mathematica/LightTemperatureMap'
.namedColourGradient
.resample(24)
~~~

![](sw/spl/Help/Image/namedColourGradient-C.svg)

* * *

See also: ColourGradient, ColourGradient, colourGradients, namedColourPalette

Guides: Colour Functions
