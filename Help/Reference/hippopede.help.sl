# hippopede

- _hippopede(a, b)_

Answer the hippopede,
also known as the horse fetter,
a curve given by the polar equation _r²=4b(a-bsin²θ)_.

Plot with _a=1,b=0.75_:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	hippopede(1, 0.75)
)
~~~

![](sw/spl/Help/Image/hippopede-A.svg)

Plot with varying _a_:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	[0.5 1 1.5 2].collect { :a |
		hippopede(a, 1)
	}
)
~~~

![](sw/spl/Help/Image/hippopede-B.svg)

Plot with varying _b_:

~~~spl svg=C
(0 -- 2.pi).functionPlot(
	[0.65 0.75 0.9 1.1].collect { :b |
		hippopede(1, b)
	}
)
~~~

![](sw/spl/Help/Image/hippopede-C.svg)

* * *

See also: epitrochoid, hypotrochoid

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Hippopede.html),
_W_
[1](https://en.wikipedia.org/wiki/Hippopede)

