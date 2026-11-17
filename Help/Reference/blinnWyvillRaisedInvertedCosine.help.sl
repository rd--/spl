# blinnWyvillRaisedInvertedCosine

- _blinnWyvillRaisedInvertedCosine(x)_

The Blinn-Wyvill raised inverted cosine approximation.

Plot with standard library function:

~~~spl svg=A
(0.0 -- 1.0).functionPlot(
	[
		blinnWyvillRaisedInvertedCosine/1,
		{ :x |
			1.0 - (x.pi.cos * 0.5 + 0.5)
		}
	]
)
~~~

![](Help/Image/blinnWyvillRaisedInvertedCosine-A.svg)

* * *

See also: cos

References:
_W_
[1](http://en.wikipedia.org/wiki/Raised-cosine_filter)
