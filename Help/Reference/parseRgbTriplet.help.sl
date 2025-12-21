# parseRgbTriplet

- _parseRgbTriplet(s)_

Parse a subset of the _Css_ and _Svg_ format _rgb_ colour notation.
The answer is an _(r,g,b)_ triple in _(0,1)_.

```
>>> 'rgb(152,236,232)'
>>> .parseRgbTriplet
[0.5961 0.9255 0.9098]
```

The triplet can, in fact, have four places, indicating an _alpha_ channel:

```
>>> 'rgb(152,236,232,128)'
>>> .parseRgbTriplet
[0.5961 0.9255 0.9098 0.50196]
```

* * *

See also: Colour, parseHexTriplet, parseRgbColour, RgbColour, rgbString

Guides: Colour Functions

Categories: Colour, Parsing
