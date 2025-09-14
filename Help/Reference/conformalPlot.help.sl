# conformalPlot

- _conformalPlot(f, [⌊ ⌈], [p q], [i j])_

Plot a function over the complex plane from _⌊_ to _⌈_,
constructing a grid of _p_ real and _q_ imaginary lines,
sampled to _i_ and _j_ places respectively.

_z²_ is a conformal map:

~~~spl svg=A
{ :z |
	z.square
}.conformalPlot(
	[0J0 1J1],
	[5 5],
	[25 25]
)
~~~

![](sw/spl/Help/Image/conformalPlot-A.svg)

_1/z_ is a conformal map:

~~~spl svg=B
{ :z |
	1 / z
}.conformalPlot([-2J-2 2J2], [6 6], [75 75])
~~~

![](sw/spl/Help/Image/conformalPlot-B.svg)

_cos(z)_ is a conformal map:

~~~spl svg=C
{ :z |
	z.cos
}.conformalPlot(
	[0J0, 2.pi.j(1.pi)],
	[6 6],
	[50 50]
)
~~~

![](sw/spl/Help/Image/conformalPlot-C.svg)

_z³_ is a conformal map:

~~~spl svg=D
{ :z |
	z.cube
}.conformalPlot(
	[0J0 2J2],
	[7 7],
	[25 25]
)
~~~

![](sw/spl/Help/Image/conformalPlot-D.svg)

_z+1/z_ is a conformal map:

~~~spl svg=E
{ :z |
	z + (1 / z)
}.conformalPlot(
	[-3J-3 3J3],
	[8 8],
	[50 50]
)
~~~

![](sw/spl/Help/Image/conformalPlot-E.svg)

~~~spl svg=F
{ :z |
	z ^ (3 / 2)
}.conformalPlot(
	[0J0 1J1],
	[15 15],
	[25 25]
)
~~~

![](sw/spl/Help/Image/conformalPlot-F.svg)

The Cayley transform, _(z-i)/(z+i)_:

~~~spl svg=G
cayleyTransform:/1
.conformalPlot(
	[-0.75J-0.75 1J1],
	[7 7],
	[75 75]
)
~~~

![](sw/spl/Help/Image/conformalPlot-G.svg)

The identity transform:

~~~spl svg=H
identity:/1
.conformalPlot(
	[-0J-1 1J1],
	[7 7],
	[25 25]
)
~~~

![](sw/spl/Help/Image/conformalPlot-H.svg)

* * *

See also: carpetPlot, cayleyTransform

Guides: Complex Number Functions, Plotting Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ConformalMapping.html),
_Maple_
[1](https://www.maplesoft.com/support/help/maple/view.aspx?path=plots%2Fconformal),
_W_
[1](https://en.wikipedia.org/wiki/Conformal_map)
