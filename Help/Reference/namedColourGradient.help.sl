# namedColourGradient

- _namedColourGradient(collectionName, gradientName)_
- _namedColourGradient(gradientName)_

Answer a `ColourGradient` by looking up the `colourGradients` library.
The binary form is a direct lookup:

Lookup the _Summer_ gradient in the _ggthemes_ collection:

~~~spl svg=A
'mpl'
.namedColourGradient('plasma')
.resample(24)
~~~

![](sw/spl/Help/Image/namedColourGradient-A.svg)

The unary form answers a gradients that areuniquely named across all collections.
Lookup the _isol_ gradient,
which is in the _pals_ collection:

~~~spl svg=B
'isol'.namedColourGradient.resample(24)
~~~

![](sw/spl/Help/Image/namedColourGradient-B.svg)

The unary form allows specifying the collection and gradient names separated by a forward slash:

~~~spl svg=C
'mathematica/light-temperature-map'
.namedColourGradient
.resample(24)
~~~

![](sw/spl/Help/Image/namedColourGradient-C.svg)

* * *

See also: ColourGradient, ColourGradient, colourGradients, namedColourPalette

Guides: Colour Guides
