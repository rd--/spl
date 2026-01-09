# NcsColour

- _NcsColour(x)_

Answer an `RgbColour` representing the Ncs colour specified at _x_.

Colour swatch for _NCS S 0580-Y10R_,
specified as a string:

~~~spl svg=A
NcsColour('NCS S 0580-Y10R')
~~~

![](sw/spl/Help/Image/NcsColour-A.svg)

Colour swatch for _NCS S 4055-R95B_,
specified as a list:

~~~spl svg=B
NcsColour([40 55 'R' 95 'B'])
~~~

![](sw/spl/Help/Image/NcsColour-B.svg)

* * *

See also: ncsToRgb, parseNcs

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Natural_Color_System)
