# sin

- _sin(z)_

Answers the sin of _z_.

```
>>> 1/3.pi.sin
3.sqrt / 2

>>> 1/5.pi.sin
((5 / 8) - (5.sqrt / 8)).sqrt

>>> 60.degree.sin
3.sqrt / 2

>>> 18.degree.sin
1 / (5.sqrt + 1)
```

Prefix notation:

```
>>> sin(1.2)
0.932039
```

`sin` can take `Complex` number inputs:

```
>>> 2.5J1.sin
0.923491J-0.941505

>>> let a = 2.5;
>>> let b = 1;
>>> (a.sin * b.cosh) + (a.cos * b.sinh).i
2.5J1.sin
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].sin
[0.932039 0.997495 0.973848]
```

Values of `sin` at fixed points:

```
>>> 0:6.collect { :n |
>>> 	(n / 6).pi.sin
>>> }
[0, 1 / 2, 3.sqrt / 2, 1, 3.sqrt / 2, 1 / 2, 0]
```

`sin` is an odd function:

```
>>> let n = (0 -- 2.pi).atRandom;
>>> -n.sin
n.sin.negate
```

`sin` has the mirror property:

```
>>> let n = (0 -- 2.pi).atRandom.j(1);
>>> n.conjugate.sin
n.sin.conjugate
```

Fixed point:

```
>>> 0.sin
0
```

The inverse is `arcSin`:

```
>>> 1.sin.arcSin
1
```

Maclaurin series:

```
>>> 0.5.sin
0.479426

>>> let x = 0.5;
>>> 0:23.sum { :n |
>>> 	let m = (2 * n) + 1;
>>> 	let c = (-1 ^ n) / m.!;
>>> 	c * (x ^ m)
>>> }
0.479426
```

List of _x_-coordinates of point moving in clockwise square spiral,
OEIS [A174344](https://oeis.org/A174344):

```
>>> let f = { :n |
>>> 	(n = 0).if {
>>> 		0
>>> 	} {
>>> 		let a = 4 * (n - 1) + 1;
>>> 		let b = a.sqrt.floor % 4;
>>> 		f(n - 1) + sin(b.pi / 2)
>>> 	}
>>> };
>>> 0:74.collect(f:/1)
[
	 0  1  1  0 -1 -1 -1  0  1  2
	 2  2  2  1  0 -1 -2 -2 -2 -2
	-2 -1  0  1  2  3  3  3  3  3
	 3  2  1  0 -1 -2 -3 -3 -3 -3
	-3 -3 -3 -2 -1  0  1  2  3  4
	 4  4  4  4  4  4  4  3  2  1
	 0 -1 -2 -3 -4 -4 -4 -4 -4 -4
	-4 -4 -4 -3 -2
]
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 2.pi).functionPlot(sin:/1)
~~~

![](sw/spl/Help/Image/sin-A.svg)

Noncommensurate waves (quasiperiodic function):

~~~spl svg=B
(0 -- 16.pi).functionPlot { :x |
	x.sin + (x * 2.sqrt).sin
}
~~~

![](sw/spl/Help/Image/sin-B.svg)

Draw the `sin` function at integer points:

~~~spl png=C
{ :x :y |
	(x * y).sin
}.table(-40:40, -40:40).abs.Greymap
~~~

![](sw/spl/Help/Image/sin-C.png)

Plot `sin` alongside a Padé approximation:

~~~spl svg=D
(-1.pi -- 1.pi).functionPlot([
	sin:/1,
	sinApproximation:/1
])
~~~

![](sw/spl/Help/Image/sin-D.svg)

Lissajous figure:

~~~spl svg=E
(0 -- 2.pi).parametricPlot(
	sin:/1,
	{ :x | (x * 2).sin }
)
~~~

![](sw/spl/Help/Image/sin-E.svg)

Approximate the almost nowhere differentiable Riemann–Weierstrass function:

~~~spl svg=F
(0 -- 2.pi).functionPlot { :x |
	1:12.collect { :j |
		(j ^ 2 * x).sin / (j ^ 2)
	}.sum
}
~~~

![](sw/spl/Help/Image/sin-F.svg)

Intensity of the Fraunhofer diffraction pattern of a circular aperture versus diffraction angle:

~~~spl svg=G
(0.01 -- 1/2.pi).functionPlot { :theta |
	let a = 2.besselJ(10 * theta.sin);
	let b = 10 * theta.sin;
	2 * (a / b).square
}
~~~

![](sw/spl/Help/Image/sin-G.svg)

Plot over a subset of the complexes:

~~~spl png=H
[-4J-2 4J2].complexPlot(sin:/1)
~~~

![](sw/spl/Help/Image/sin-H.png)

Plot of complex `sin` function:

~~~spl png=I
[-5J-5 5J5].complexPlot { :z |
	(z.sin ^ 3) / ((z + 1) ^ 4)
}
~~~

![](sw/spl/Help/Image/sin-I.png)

Plot with increasing density:

~~~spl svg=J
(0.005 -- 0.025).subdivide(300)
.collect { :x |
	(1 / x).sin
}.scatterPlot
~~~

![](sw/spl/Help/Image/sin-J.svg)

Plot simple sine & cosine curve by R.Cabello:

~~~spl svg=K
(0 -- 20.pi).functionPlot { :t |
	[
		sin(t * 0.7).sin,
		cos(t * 0.3).cos,
		sin(t * 0.2).sin
	]
}
~~~

![](sw/spl/Help/Image/sin-K.svg)

Nearest integer to _sin(n)_,
OEIS [A000494](https://oeis.org/A000494):

~~~spl svg=L
0:200.sin.round.discretePlot
~~~

![](sw/spl/Help/Image/sin-L.svg)

* * *

See also: arcSin, cos, csc, haversine, sinDegrees, sinh, tan

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Sine.html)
[2](https://reference.wolfram.com/language/ref/Sin.html),
_OEIS_
[1](https://oeis.org/A174344),
_Smalltalk_
5.6.7.13,
_W_
[1](https://en.wikipedia.org/wiki/Sine)

Categories: Math, Trigonometry
