# gaussianFilter

- _gaussianFilter(x, r)_

Filters _x_ by convolving with a Gaussian kernel of radius _r_.

Gaussian filter of a list:

~~~spl svg=A
let x = [1 1 2 1 4 3 4 3 2 4 2];
let y = x.gaussianFilter(2);
[x, y].linePlot
~~~

![](sw/spl/Help/Image/gaussianFilter-A.svg)

Gaussian filtering of a numeric vector:

~~~spl svg=B
let x = [0 0 0 0 1 1 1 1 1 0 0 0 0];
let y = x.gaussianFilter(2);
[x, y].linePlot
~~~

![](sw/spl/Help/Image/gaussianFilter-B.svg)

Impulse responses of Gaussian smoothing filter for selected radii:

~~~spl svg=C
let x = [1].arrayPad([15 15], 0);
[3 6 9 12].collect { :r |
	x.gaussianFilter(r)
}.linePlot
~~~

![](sw/spl/Help/Image/gaussianFilter-C.svg)

* * *

See also: convolve, gaussianKernel

Guides: Filter Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GaussianFilter.html),
_W_
[1](https://en.wikipedia.org/wiki/Gaussian_filter)
