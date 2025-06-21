# warpingPlot

- _warpingPlot(x, y, c)_

Answer a warping diagram between two sequences,
_x_ and _y_,
given a warping correspondance _c_.

Warping between 6- and 7- vectors:

~~~spl svg=A
let x = [0 2 0 1 0 0];
let y = [0 0 0.5 2 0 1 0];
let c = x.warpingCorrespondence(y);
x.warpingPlot(y, c)
~~~

![](sw/spl/Help/Image/warpingPlot-A.svg)

Warping between 11- and 13- vectors:

~~~spl svg=B
let x = [0 0 1 1 0 0 -1 0 0 0 0];
let y = [0 0 0 0 2 2 0 0 0 -1 -0.5 0 0];
let c = x.warpingCorrespondence(y);
x.warpingPlot(y, c)
~~~

![](sw/spl/Help/Image/warpingPlot-B.svg)

Warping between 11- and 13- vectors with mismatched contours:

~~~spl svg=C
let x = [0 0 2 2 0 0 -2 0 0 0 0];
let y = [0 0 0 2 2 0 0 0 1 0 0 0 0];
let c = x.warpingCorrespondence(y);
x.warpingPlot(y, c)
~~~

![](sw/spl/Help/Image/warpingPlot-C.svg)

* * *

See also: warpingCorrespondence, warpingDistance, warpingMatrices

Guides: Distance Functions, Plotting Functions, Sequence Alignment Functions
