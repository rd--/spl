# blinnWyvillRaisedInvertedCosine

- _blinnWyvillRaisedInvertedCosine(x)_

The Blinn-Wyvill raised inverted cosine approximation.

Plot with standard library function:

~~~spl svg=A
(0 -- 1).functionPlot([
	blinnWyvillRaisedInvertedCosine:/1,
	{ :x | 1 - (x.pi.cos * 0.5 + 0.5) }
])
~~~

![](sw/spl/Help/Image/blinnWyvillRaisedInvertedCosine-A.svg)

* * *

See also: cos

References:
_W_
[1](http://en.wikipedia.org/wiki/Raised-cosine_filter)
