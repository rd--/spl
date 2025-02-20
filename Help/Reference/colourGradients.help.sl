# colourGradients

- _colourGradients(aSystem)_

Answer a collection of colour gradients collated from a variety of sources.
The collection is keyed firstly by the collection name,
and secondly by the palette name.
Items are _(colourList, positionList)_ pairs.

Count collections:

```
>>> system.colourGradients.size
199
```

Count gradients:

```
>>> system
>>> .colourGradients
>>> .collect(size:/1)
>>> .sum
4888
```

Plot the three colour _bhw1\_01_ gradient from the _bhw\_bhw1_ collection:

~~~spl svg=A
system
.colourGradients['bhw_bhw1', 'bhw1_01']
.asColourGradient
~~~

![](sw/spl/Help/Image/colourGradients-A.svg)

Plot the four colour _bhw1\_sunset1_ gradient from the _bhw\_bhw1_ collection:

~~~spl svg=B
system
.colourGradients[
	'bhw_bhw1',
	'bhw1_sunset1'
]
.asColourGradient
~~~

![](sw/spl/Help/Image/colourGradients-B.svg)

Plot the one-hundred and twenty-eight colour _plasma_ gradient from the _viridis_ collection,
resampled to sixteen colours:

~~~spl svg=C
system
.colourGradients[
	'viridis',
	'plasma'
]
.asColourGradient
.resample(16)
~~~

![](sw/spl/Help/Image/colourGradients-C.svg)

Plot the two-hundred and sixty colour _rainbow-m_ gradient from the _mathematica_ collection,
resampled to twenty-four colours:

~~~spl svg=D
system
.colourGradients[
	'mathematica',
	'rainbow-m'
]
.asColourGradient
.resample(24)
~~~

![](sw/spl/Help/Image/colourGradients-D.svg)

Plot the ten colour _cbcYlGnBu_ gradient from the _jjg\_cbcont\_seq_ collection:

~~~spl svg=E
system
.colourGradients[
	'jjg_cbcont_seq',
	'cbcYlGnBu'
]
.asColourGradient
~~~

![](sw/spl/Help/Image/colourGradients-E.svg)

The `asBlock` method of `ColourGradient` answers a one argument `Block` that reads the gradient at the indicated position.
Use a resampled form of the _pastel_ gradient from the _mathematica_ collection to colour a plot of a sine function:

~~~spl png=F
let i = (-2 -- 2).discretize(100);
let f:/1 = system.colourGradients[
	'mathematica',
	'pastel'
].asColourGradient
.resample(16)
.asBlock;
{ :x :y |
	f((x.sin * y.sin) * 0.5 + 0.5)
}.table(i, i).Image
~~~

![](sw/spl/Help/Image/colourGradients-F.png)

* * *

See also: asColourGradient, colourPalettes, Colour, ColourGradient, RgbColour

Guides: Colour Functions
