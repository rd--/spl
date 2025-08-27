# serpentineCurve

- _serpentineCurve(a, b)_

An algebraic curve studied by L’Hôpital and Huygens, and named and classified by Newton in 1701.

~~~spl svg=A
(0.05.pi -- 0.95.pi).functionPlot(
	serpentineCurve(1, 1)
)
~~~

![](sw/spl/Help/Image/serpentineCurve-A.svg)

Plot functional form:

~~~spl svg=B
let a = 1;
let b = 1;
(-5 -- 5).functionPlot { :x |
	let d = x.square + a.square;
	let y = (a * b * x) / d;
	[x, y]
}
~~~

![](sw/spl/Help/Image/serpentineCurve-B.svg)

* * *

See also: foliumOfDescartes

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SerpentineCurve.html)
_W_
[1](https://en.wikipedia.org/wiki/Serpentine_curve)
