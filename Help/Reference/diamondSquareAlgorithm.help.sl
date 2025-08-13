# diamondSquareAlgorithm

- _diamondSquareAlgorithm(r, d, h, c)_

Answer a square heightmap,
of size _2ᵈ+1_ places,
drawing values from the random number generator _r_,
and of roughness given by _h_,
and with initial corner values _c_,
utilising the diamond-square algorithm.

A heightmap of _17×17_ places with _h=0.65_ and specified corner values:

~~~spl svg=A
let c = [0.25 0 0.25 0];
Sfc32(803184)
.diamondSquareAlgorithm(4, 0.65, c)
.matrixPlot
~~~

![](sw/spl/Help/Image/diamondSquareAlgorithm-A.svg)

If _c_ is elided the corners are initialized to `zero`:

~~~spl png=B
let r = Sfc32(797142);
diamondSquareAlgorithm(r, 6, 0.85)
.rescale
.Graymap
~~~

![](sw/spl/Help/Image/diamondSquareAlgorithm-B.png)

* * *

See also: RandomNumberGenerator

Guides: Geometry Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Diamond-square_algorithm)

Further Reading: Fournier 1982
