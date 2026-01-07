# RybColour

- _RybColour([r y b], α=1)_

Convert from a red-yellow-blue colour specified by the triple _(r,y,b)_ to a red-green-blue colour triple.
Uses an algorithm by Gossett and Chen,
the conversion function is `rybToRgb`.

White, black, red, yellow, blue:

~~~spl svg=A
[0 0 0; 1 1 1; 1 0 0; 0 1 0; 0 0 1]
.collect(RybColour:/1).enclose.arrayPlot
~~~

![](sw/spl/Help/Image/RybColour-A.svg)

Yellow and blue is green:

~~~spl svg=B
RybColour([0 1 1])
~~~

![](sw/spl/Help/Image/RybColour-B.svg)

Red and yellow is orange:

~~~spl svg=C
RybColour([1 1 0])
~~~

![](sw/spl/Help/Image/RybColour-C.svg)

Red and blue is purple:

~~~spl svg=D
RybColour([1 0 1])
~~~

![](sw/spl/Help/Image/RybColour-D.svg)

Blue and green is cyan,
here green is given as _(0,0.5,0.5)_ and blue as _(0,0,0.5)_:

~~~spl svg=E
RybColour([0 0.5 1])
~~~

![](sw/spl/Help/Image/RybColour-E.svg)

Threads over lists:

~~~spl svg=F
[
	0 0 0;
	1 1 1;
	0 0 1;
	1 1 0;
	0 1 0;
	1 0 1;
	0 1 1;
	1 0 0
].RybColour.enclose.arrayPlot
~~~

![](sw/spl/Help/Image/RybColour-F.svg)

A random shuffle of the 27-colour three-level pallette:

~~~spl svg=G
let r = Sfc32(938745);
let a = [0 1 2].tuples(3);
let b = a.fisherYatesShuffle(r);
RybColour(b / 2).reshape([3 9])
.arrayPlot
~~~

![](sw/spl/Help/Image/RybColour-G.svg)

A random shuffle of the 64-colour four-level pallette:

~~~spl svg=H
let r = Sfc32(349527);
let a = [0 1 2 3].tuples(3);
let b = a.fisherYatesShuffle(r);
RybColour(b / 3).reshape([8 8])
.arrayPlot
~~~

![](sw/spl/Help/Image/RybColour-H.svg)

A farthest-first traversal of the same colour palette:

~~~spl svg=I
let a = [0 1 2 3].tuples(3);
let b = a.farthestFirstTraversal;
RybColour(b / 3).reshape([8 8])
.arrayPlot
~~~

![](sw/spl/Help/Image/RybColour-I.svg)

* * *

See also: RgbColour, rybToRgb

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/RYB_color_model)

Further Reading: Gossett 2004
