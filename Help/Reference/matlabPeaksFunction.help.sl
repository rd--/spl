# matlabPeaksFunction

- _matlabPeaksFunction(x, y)_

Answer the _z_-coordinate of the Matlab _peaks_ function at _(x,y)_.

Plot the function on a small mesh:

~~~spl svg=A
let i = (-3 -- 3).subdivide(4);
{ :x :y |
	x.matlabPeaksFunction(y) * 0.4
}.table(i, i).surfacePlot
~~~

![](sw/spl/Help/Image/matlabPeaksFunction-A.svg)

* * *

See also: surfacePlot

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/peaks.html)
