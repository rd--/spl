# polarPlot

- _polarPlot(aList)_
- _polarPlot(domain, aBlock:/1 | aList)_

Generate a polar plot of a curve with radius r as a function of angle θ in _domain_.

A circle:

~~~spl svg=A
(0 -- 1.pi).polarPlot(sin:/1)
~~~

![](sw/spl/Help/Image/polarPlot-A.svg)

Another circle:

~~~spl svg=B
(0 -- 2.pi).polarPlot { :t | 1 }
~~~

![](sw/spl/Help/Image/polarPlot-B.svg)

A knot:

~~~spl svg=C
(0 -- 1.pi).polarPlot { :t |
	(3 * t).sin * t
}
~~~

![](sw/spl/Help/Image/polarPlot-C.svg)

An oscillation around a circle:

~~~spl svg=D
(0 -- 2.pi).polarPlot([
	{ :t |
		1
	},
	{ :t |
		1 + (1 / 10 * (10 * t).sin)
	}
])
~~~

![](sw/spl/Help/Image/polarPlot-D.svg)

An Archimedean spiral:

~~~spl svg=E
(0 -- 20).polarPlot { :t | t ^ (1 / 2) }
~~~

![](sw/spl/Help/Image/polarPlot-E.svg)

Another Archimedean spiral:

~~~spl svg=F
(0 -- 20).polarPlot { :t | t ^ 1 }
~~~

![](sw/spl/Help/Image/polarPlot-F.svg)

A circle, given as a `List` or polar coordinates:

~~~spl svg=G
(0 -- 2.pi).discretize(99).collect { :each |
	[1, each]
}.polarPlot
~~~

![](sw/spl/Help/Image/polarPlot-G.svg)

Spiral of primes:

~~~spl svg=H
let k = 99;
let r = k.prime;
[
	1:k.collect { :each |
		[r, 2.pi / k * each]
	},
	1:k.collect { :n |
		let t = (0.5.pi - (n * 4.pi / k));
		[n.prime, t % 2.pi]
	}
].polarPlot
~~~

![](sw/spl/Help/Image/polarPlot-H.svg)

Plot the butterfly curve:

~~~spl svg=I
(0 -- 12.pi).polarPlot(500) { :theta |
	let a = theta.sin.exp;
	let b = 2 * (4 * theta).cos;
	let c = (1/24 * (2 * theta - 1.pi)).sin;
	a - b + (c ^ 5)
}
~~~

![](sw/spl/Help/Image/polarPlot-I.svg)

Plot using negative radius values, reflected through the origin:

~~~spl svg=J
(0 -- 2.pi).discretize(100) { :theta |
	let a = 2 * theta;
	let rho = a.sin * a.cos;
	[rho, theta]
}.polarPlot
~~~

![](sw/spl/Help/Image/polarPlot-J.svg)

A quintic curve:

~~~spl svg=K
(-0.9.pi -- 0.9.pi).polarPlot { :t |
	t.sin / (1 + (t.cos * (2 * t).cos))
}
~~~

![](sw/spl/Help/Image/polarPlot-K.svg)

* * *

See also: discretePlot, functionPlot, graphPlot, linePlot, matrixPlot, parametricPlot, scatterPlot, surfacePlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PolarPlot.html),
_Mathworks_
[1](https://www.mathworks.com/help/matlab/ref/polarplot.html)

Categories: Plotting
