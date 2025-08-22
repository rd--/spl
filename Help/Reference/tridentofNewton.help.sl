# tridentOfNewton

- _tridentOfNewton([a b c d])_

Answer the trident of Newton in Cartesian form.

~~~spl svg=A
(-3 -- 2.6).functionPlot(
	[1 1 1 1].tridentOfNewton
	.clip([-10 10])
)
~~~

![](sw/spl/Help/Image/tridentOfNewton-A.svg)

~~~spl svg=A
(-3 -- 3).functionPlot(
	[
		1 1 1 -1;
		-1 -1 -1 1;
		1 2 3 4
	].collect { :each |
		each.tridentOfNewton
		.clip([-10 10])
	}
)
~~~

![](sw/spl/Help/Image/tridentOfNewton-B.svg)

* * *

See also:

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TridentofNewton.html),
_W_
[1](https://en.wikipedia.org/wiki/Trident_curve)
