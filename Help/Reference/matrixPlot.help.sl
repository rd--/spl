# matrixPlot

- _matrixPlot(m)_

Answer a plot that gives a visual representation of the elements in the matrix _m_.

`zero` is drawn as white,
or as transparent if supported,
and the maximum value in the matrix is drawn as black.
Only the magnitude of each cell is considered,
not the sign.

Plot a 3×3 matrix:

~~~spl svg=A
[
	1 2 1;
	3 0 1;
	0 0 -1
].matrixPlot
~~~

![](Help/Image/matrixPlot-A.svg)

Plot a 10×10 matrix (see also _n = 100_):

~~~spl svg=B
let n = 10;
{ :i :j |
	[
		{ i = j } -> { 2 },
		{
			(i = (j + 1))
			||
			(i = (j - 1))
		} -> { -1 },
		{ true } -> { 0 }
	].which
}.table(1:n, 1:n).inverse.matrixPlot
~~~

![](Help/Image/matrixPlot-B.svg)

Plot the imaginary parts of a discrete Fourier transform 24×24 matrix (see also _n = 33_):

~~~spl svg=C
let n = 24;
{ :i :j |
	(2.pi.i * i * j / n).exp.imaginary
}.table(0:n, 0:n).matrixPlot
~~~

![](Help/Image/matrixPlot-C.svg)

Plot a table of values of five sine waves in random directions (see also _k = 100_):

~~~spl svg=D
let r = Sfc32(31684);
let n = r.randomReal([0 10], [5 2]);
let k = 20;
let i = (0 -- 2).subdivide(k);
{ :x :y |
	n.collect { :each |
		each.dot([x, y]).sin
	}.sum
}.table(i, i).matrixPlot
~~~

![](Help/Image/matrixPlot-D.svg)

Plot the `sin` function at integer points:

~~~spl svg=E
let i = -12:12;
{ :x :y |
	(x * y / 4).sin
}.table(i, i).matrixPlot
~~~

![](Help/Image/matrixPlot-E.svg)

Plot a random 50×10 matrix:

~~~spl svg=F
Sfc32(17492)
.randomReal([0 1], [50 10])
.matrixPlot
~~~

![](Help/Image/matrixPlot-F.svg)

Plot a row-order 4×4 linear image:

~~~spl svg=G
[4 4].iota.matrixPlot
~~~

![](Help/Image/matrixPlot-G.svg)

Noise modulated `sin` function:

~~~spl svg=H
let r = Sfc32(367281);
let i = 1:18:2;
{ :x :y |
	let z = ((x + y) / 1.pi).sin;
	z * r.nextRandomFloat
}.table(i, i).matrixPlot
~~~

![](Help/Image/matrixPlot-H.svg)

A matrix of transition probabilities,
columns sum to `one` (Xenakis 1992, p.89):

~~~spl svg=I
[
	021 357 084 189 165 204 408 096;
	084 089 076 126 150 136 072 144;
	084 323 021 126 150 036 272 144;
	336 081 019 084 135 024 048 216;
	019 063 336 171 110 306 102 064;
	076 016 304 114 100 204 018 096;
	076 057 084 114 100 054 068 096;
	304 014 076 076 090 036 012 144
].matrixPlot
~~~

![](Help/Image/matrixPlot-I.svg)

* * *

See also: arrayPlot, asGreyscaleSvg, Bitmap, discretePlot, functionPlot, graphPlot, Greymap, linePlot, parametricPlot, scatterPlot, surfacePlot

Guides: Matrix Functions, Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MatrixPlot.html),
_W_
[1](https://en.wikipedia.org/wiki/Heat_map)

Further Reading: Moreland 2009

Categories: Plotting
