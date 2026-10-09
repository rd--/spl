# arnoldsCatMap

- _arnoldsCatMap(m, k=1)_

Discrete analogue of the Arnold’s cat map,
a chaotic map from the torus into itself.
Apply _k_ iterations of the map to the the matrix _m_.

A smooth diagonal rainbow,
transformed into vertical lines by _k=4_:

~~~spl svg=A
let n = 13;
{ :y :x |
	HsvColour[
		((x + y) % n) / n,
		0.6,
		0.92
	]
}.table(1:n, 1:n)
.arnoldsCatMap(4)
.ColourGrid
~~~

![](Help/Image/arnoldsCatMap-A.svg)

* * *

See also: mod, recurrenceMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ArnoldsCatMap.html),
_W_
[1](https://en.wikipedia.org/wiki/Arnold%27s_cat_map)
