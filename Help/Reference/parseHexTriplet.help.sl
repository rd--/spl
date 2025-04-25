# parseHexTriplet

- _parseHexTriplet(aString)_

Parse a subset of the _Css_ and _Html_ format hexadecimal colour notation,
answering a `List` of _(0,1)_ values.
The triplet must have a leading number sign.

```
>>> '#98ECE8'.parseHexTriplet
[0.59608 0.92549 0.90980]
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

* * *

See also: Colour, hexTriplet, parseHexColour, parseRgbColour, RgbColour, rgbString

Guides: Colour Functions, Parsing Functions

Categories: Colour, Parsing
