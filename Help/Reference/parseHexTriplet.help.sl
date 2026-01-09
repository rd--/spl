# parseHexTriplet

- _parseHexTriplet(s)_

At `String`,
parse a subset of the _Css_ and _Html_ format hexadecimal colour notation,
answering a `List` of _(0,1)_ values.
The triplet must have a leading number sign.

```
>>> '#98ECE8'.parseHexTriplet
[0.59608 0.92549 0.90980]

>>> '#FECB00'.parseHexTriplet * 255
[254 203 0]

>>> '#005293'.parseHexTriplet * 255
[0 82 147]
```

The triplet can, in fact, have four places, indicating an _alpha_ channel:

```
>>> '#98ECE87F'.parseHexTriplet
[0.59608 0.92549 0.90980 0.49804]
```

Draw parsed colour:

~~~spl svg=A
'#E0A32E'.parseHexTriplet.asColour
~~~

![](sw/spl/Help/Image/parseHexTriplet-A.svg)

A rainbow:

~~~spl svg=B
[
	'#DD0000'
	'#FE6230'
	'#FEF600'
	'#00BB00'
	'#009BFE'
	'#000083'
	'#30009B'
].collect(parseHexTriplet:/1)
.enclose.arrayPlot
~~~

![](sw/spl/Help/Image/parseHexTriplet-B.svg)

* * *

See also: Colour, hexTriplet, parseHexColour, parseRgbColour, RgbColour, rgbString

Guides: Colour Functions, Parsing Functions

Categories: Colour, Parsing
