# ncsLookup

- _ncsLookup(x)_

Lookup a standard Ncs colour in the `ncsColourCatalogue`.
Answer an `RgbColour` value.

Colour swatch for _NCS S 0580-Y10R_:

~~~spl svg=A
'NCS S 0580-Y10R'.ncsLookup
~~~

![](sw/spl/Help/Image/ncsLookup-A.svg)

Colour swatch for _NCS 4055-R90B_:

~~~spl svg=B
'NCS 4055-R90B'.ncsLookup
~~~

![](sw/spl/Help/Image/ncsLookup-B.svg)

* * *

See also: ncsColourCatalogue, ncsToRgb, NcsColour, parseNcs

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Natural_Color_System)
