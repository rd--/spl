# vectorPlot

- _vectorPlot(f:/2, x, y)_
- _vectorPlot(f:/2, c)_

Answer a vector plot of the vector field specicifed by the function _f_ of _x_ and _y_,
specified as `Interval`s.

Plot the vector field _(y,-x)_:

~~~spl svg=A
{ :x :y |
	[y, 0 - x]
}.vectorPlot(-3 -- 3, -3 -- 3)
~~~

![](sw/spl/Help/Image/vectorPlot-A.svg)

Plot the vector field _(x+y,y-x)_:

~~~spl svg=B
{ :x :y |
	[x + y, y - x]
}.vectorPlot(-3 -- 3, -3 -- 3)
~~~

![](sw/spl/Help/Image/vectorPlot-B.svg)

Plot the vector field _(y,x+y)_:

~~~spl svg=C
{ :x :y |
	[y, x + y]
}.vectorPlot(-3 -- 3, -3 -- 3)
~~~

![](sw/spl/Help/Image/vectorPlot-C.svg)

Plot the vector field _(-1-x²+y,1+x-y²)_:

~~~spl svg=D
{ :x :y |
	[-1 - (x ^ 2) + y, 1 + x - (y ^ 2)]
}.vectorPlot(-3 -- 3, -3 -- 3)
~~~

![](sw/spl/Help/Image/vectorPlot-D.svg)

Plot the vector field _(y²,x²-y²)_:

~~~spl svg=E
{ :x :y |
	[y ^ 2, (x ^ 2) - (y ^ 2)]
}.vectorPlot(-3 -- 3, -3 -- 3)
~~~

![](sw/spl/Help/Image/vectorPlot-E.svg)

Plot the vector field _(x,y)_:

~~~spl svg=F
{ :x :y |
	[x, y]
}.vectorPlot(-3 -- 3, -3 -- 3)
~~~

![](sw/spl/Help/Image/vectorPlot-F.svg)

Plot the vector field _(y-αx,-x-αy)_ where _α=(1-x²-y²)²_:

~~~spl svg=G
{ :x :y |
	let a = (1 - (x ^ 2) - (y ^ 2)) ^ 2;
	[
		y - (x * a),
		0 - x - (y * a)
	]
}.vectorPlot(-3 -- 3, -3 -- 3)
~~~

![](sw/spl/Help/Image/vectorPlot-G.svg)

Plot the vector field _(1,y(1-y))_:

~~~spl svg=H
{ :x :y |
	[1, y * (1 - y)]
}.vectorPlot(0 -- 2, 0 -- 2)
~~~

![](sw/spl/Help/Image/vectorPlot-H.svg)

Plot the vector field _(y,sin(-x))_:

~~~spl svg=I
{ :x :y |
	[y, 0 - x.sin]
}.vectorPlot(-3.pi -- 3.pi, -4 -- 4)
~~~

![](sw/spl/Help/Image/vectorPlot-I.svg)


Plot the vector field _(sin(y),cos(x))_:

~~~spl svg=J
{ :x :y |
	[y.sin, x.cos]
}.vectorPlot(-1.pi -- 1.pi, -1.pi -- 1.pi)
~~~

![](sw/spl/Help/Image/vectorPlot-J.svg)

In the binary form,
a list of points for showing field vectors is specified:

~~~spl svg=K
let r = Sfc32(3627184);
let c = r.randomReal([-3 3], [300 2]);
{ :x :y |
	[-1 - (x ^ 2) + y, 1 + x - (y ^ 2)]
}.vectorPlot(c)
~~~

![](sw/spl/Help/Image/vectorPlot-K.svg)

* * *

See also: contourPlot, densityPlot, parametricPlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/VectorPlot.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/quiver.html),
_W_
[1](https://en.wikipedia.org/wiki/Vector_field)
