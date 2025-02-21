# colourGradients

- _colourGradients(aSystem)_

Answer a collection of colour gradients collated from a variety of sources.
The collection is keyed firstly by the collection name,
and secondly by the palette name.
Items are _(colourList, positionList)_ pairs,
which can be converted into a `ColourGradient` value using `asColourGradient`.

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

Select collections by prefix:

```
>>> system
>>> .colourGradients
>>> .keys
>>> .select { :each |
>>> 	each.beginsWith('esri')
>>> }
[
	'esri_effects'
	'esri_events'
	'esri_hillshade'
	'esri_hypsometry_bath'
	'esri_hypsometry_ca'
	'esri_hypsometry_eu'
	'esri_hypsometry_na'
	'esri_hypsometry_planet'
	'esri_hypsometry_sa'
]
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

Resample and plot the _ocean.deep_ gradient from the _pals_ collection:

~~~spl svg=G
system
.colourGradients[
	'pals',
	'ocean.deep'
]
.asColourGradient
.resample(32)
~~~

![](sw/spl/Help/Image/colourGradients-G.svg)


Resample and plot the _kovesi.isoluminant_cgo_80_c38_ gradient from the _pals_ collection:

~~~spl svg=H
system
.colourGradients[
	'pals',
	'kovesi.isoluminant_cgo_80_c38'
]
.asColourGradient
.resample(32)
~~~

![](sw/spl/Help/Image/colourGradients-H.svg)

Sources include:

- [Environmental Systems Research Institute](https://www.esri.com/)
- [GRID-Arendal](https://www.grida.no/)
- [NASA Ocean Colour](https://oceancolor.gsfc.nasa.gov/)
- [School of Ocean and Earth Science and Technology](https://www.soest.hawaii.edu/soestwp/)

* * *

See also: asColourGradient, colourPalettes, Colour, ColourGradient, cubeHelix, parula, RgbColour

Guides: Colour Functions
