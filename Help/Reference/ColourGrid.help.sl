# ColourGrid

- _ColourGrid(m)_

A `Type` representing a colour grid specified by the matrix _m_.
The elements of _m_ must implement `asColour`.

A 3×3×3 array,
understood as a 3×3 or _(r,g,b)_ triples:

~~~spl svg=A
[
	0 0.6 0; 0.4 0.1 0.8; 0.7 0.9 0.7:;
	1 0 0.9; 0.6 0.6 1; 1 0.8 0.3
].ColourGrid
~~~

![](sw/spl/Help/Image/ColourGrid-A.svg)

A 5×11×3 array,
understood as a 5×11 matrix of _(r,g,b)_ triples:

~~~spl svg=B
Sfc32(731894)
.randomReal([0 1], [5 11 3])
.ColourGrid
~~~

![](sw/spl/Help/Image/ColourGrid-B.svg)

* * *

See also: asColour, Colour

Guides: Colour Functions, Image Functions

Categories: Graphics
