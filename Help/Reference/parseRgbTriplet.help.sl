# parseRgbTriplet

- _parseRgbTriplet(aString)_

Parse a subset of the _Css_ and _Svg_ format _rgb_ colour notation.
The answer is an _(r,g,b)_ triple in _(0,1)_.

```
>>> 'rgb(152,236,232)'
>>> .parseRgbTriplet
[0.5961 0.9255 0.9098]
```

* * *

See also: Colour, parseHexColour, parseRgbColour, RgbColour, rgbString

Guides: Colour Functions

Categories: Colour, Parsing
