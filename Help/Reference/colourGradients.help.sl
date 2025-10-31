# colourGradients

- _colourGradients(system)_

Answer a collection of colour gradients collated from a variety of sources.
The collection is keyed firstly by the collection name,
and secondly by the palette name.
Items are colour list and position list pairs,
which can be converted into a `ColourGradient` value using `asColourGradient`.

Count collections:

```
>>> system.colourGradients.size
6
```

Count gradients:

```
>>> system
>>> .colourGradients
>>> .collect(size:/1)
>>> .sum
146
```

Select collections by prefix:

```
>>> system
>>> .colourGradients
>>> .keys
>>> .select { :each |
>>> 	each.beginsWith('Mat')
>>> }
['Mathematica' 'Mathworks']
```

Plot the two colour _Winter_ gradient from the _Mathworks_ collection:

~~~spl svg=A
system
.colourGradients['Mathworks']['Winter']
.asColourGradient
~~~

![](sw/spl/Help/Image/colourGradients-A.svg)

Plot the sixteen colour _Spring_ gradient from the _Mathworks_ collection:

~~~spl svg=B
system
.colourGradients['Mathworks']['Spring']
.asColourGradient
~~~

![](sw/spl/Help/Image/colourGradients-B.svg)

Plot the one-hundred and twenty-eight colour _Plasma_ gradient from the _Viridis_ collection,
resampled to sixteen colours:

~~~spl svg=C
system
.colourGradients['Viridis']['Plasma']
.asColourGradient
.resample(16)
~~~

![](sw/spl/Help/Image/colourGradients-C.svg)

Plot the two-hundred and sixty colour _Rainbow_ gradient from the _Mathematica_ collection,
resampled to twenty-four colours:

~~~spl svg=D
system
.colourGradients[
	'Mathematica',
	'Rainbow'
]
.asColourGradient
.resample(24)
~~~

![](sw/spl/Help/Image/colourGradients-D.svg)

Plot the one-hundred twenty-eight colour _Isol_ gradient from the _Niccoli_ collection:

~~~spl svg=E
system
.colourGradients[
	'Niccoli',
	'Isol'
]
.asColourGradient
.resample(32)
~~~

![](sw/spl/Help/Image/colourGradients-E.svg)

The `asBlock` method of `ColourGradient` answers a one argument `Block` that reads the gradient at the indicated position.
Use a resampled form of the _Pastel_ gradient from the _Mathematica_ collection to colour a plot of a sine function:

~~~spl png=F
let i = (-2 -- 2).discretize(100);
let f:/1 = system.colourGradients[
	'Mathematica',
	'Pastel'
].asColourGradient
.resample(16)
.asBlock;
{ :x :y |
	f((x.sin * y.sin) * 0.5 + 0.5)
}.table(i, i).Image
~~~

![](sw/spl/Help/Image/colourGradients-F.png)

Resample and plot the _ocean.deep_ gradient from the _pals_ collection:

~~~spl svg=G
system
.colourGradients[
	'Ocean',
	'Deep'
]
.asColourGradient
.resample(32)
~~~

![](sw/spl/Help/Image/colourGradients-G.svg)

Resample and plot the _Isoluminant-Cgo-80-C38_ gradient from the _Kovesi_ collection:

~~~spl svg=H
system
.colourGradients[
	'Kovesi',
	'Isoluminant-Cgo-80-C38'
]
.asColourGradient
.resample(32)
~~~

![](sw/spl/Help/Image/colourGradients-H.svg)

A cyclic colour gradient,
_Cyclic-Mygbm-30-95-C78S25_,
from the _Kovesi_ collection:

~~~spl svg=I
system
.colourGradients[
	'Kovesi',
	'Cyclic-Mygbm-30-95-C78S25'
]
.asColourGradient
.resample(32)
~~~

![](sw/spl/Help/Image/colourGradients-I.svg)

Sources for each collection:
_Kovesi_: [1](https://github.com/peterkovesi/PerceptualColourMaps.jl) [2](https://colorcet.com/download/index.html),
_Mathematica_: [1](https://reference.wolfram.com/language/ref/ColorData.html),
_Mathworks_: [1](https://mathworks.com/help/matlab/ref/colormap.html),
_Niccoli_: [1](https://www.mathworks.com/matlabcentral/fileexchange/28982-perceptually-improved-colormaps) [2](https://kwstat.github.io/pals/reference/niccoli.html),
_Ocean_: [1](https://github.com/matplotlib/cmocean),
_Viridis_: [1](https://github.com/sjmgarnier/viridis)

_Note:_
The colour palettes catalogue is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: asColourGradient, colourPalettes, Colour, ColourGradient, cubeHelix, parula, RgbColour

Guides: Colour Functions, Library Catalogue
