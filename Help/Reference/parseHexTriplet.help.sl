# parseHexTriplet

- _parseHexTriplet(aString)_

Parse a subset of the _Css_ and _Html_ format hexadecimal colour notation,
answering a `List` of _(0,1)_ values.

```
>>> '#98ece8'.parseHexTriplet
[0.59608 0.92549 0.90980]
```

Draw parsed colour:

~~~spl svg=A
'#e0a32e'.parseHexTriplet.asColour
~~~

![](sw/spl/Help/Image/parseHexTriplet-A.svg)

* * *

See also: Colour, hexString, parseHexColour, parseRgbColour, RgbColour, rgbString

Guides: Colour Functions

Categories: Colour, Parsing
