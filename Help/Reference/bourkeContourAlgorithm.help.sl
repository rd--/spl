# bourkeContourAlgorithm

- _bourkeContourAlgorithm(d, x, y, c, f₆)_

Implements P. Bourkes contouring algorithm.
_d_ is a matrix of _z_ data,
_x_ and _y_ are lists telling the _(x, y)_ coordinates of the _z_ data at _d_,
_c_ is a list of monotonically increasing _z_ values to plot contours for,
and _f₆_ is a block to receive each contour line segment as
_(x1, y1, x2, y2, z, k)_ where _k_ is the index of _z_ in _c_.

* * *

See also: contourPlot

References:
_Bourke_
[1](https://paulbourke.net/papers/conrec/)
