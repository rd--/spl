# complexPlot

- _complexPlot([z⌊ z⌈], f:/1)_

Answer a plot of the argument, `arg`, of _f_ over the complex rectangle with corners _z⌊_ and _z⌈_.

A cyclic colour function,
from _-π_ to _π_,
identifies features such as zeros, poles and essential singularities.

The color function proceeds counterclockwise around zeros of a function:

~~~spl png=A
[-2J-2 2J2].complexPlot { :z |
	z
}
~~~

![](sw/spl/Help/Image/complexPlot-A.png)

At a multiple zero, the colors cycle around the zero multiple times:

~~~spl png=B
[-2J-2 2J2].complexPlot { :z |
	z ^ 3
}
~~~

![](sw/spl/Help/Image/complexPlot-B.png)

At a pole, the colors cycle around the point in the reverse direction:

~~~spl png=C
[-2J-2 2J2].complexPlot { :z |
	1 / z
}
~~~

![](sw/spl/Help/Image/complexPlot-C.png)

At an essential singularity, the colors cycle infinitely often:

~~~spl png=D
[-0.5J-0.5 0.5J0.5].complexPlot { :z |
	(0J1 / z).exp
}
~~~

![](sw/spl/Help/Image/complexPlot-D.png)

At a saddle point:

~~~spl png=E
[-2J-2 2J2].complexPlot { :z |
	(z ^ 3) + 1
}
~~~

![](sw/spl/Help/Image/complexPlot-E.png)

The following plot shows multiple features of the Joukowski transformation:

~~~spl png=F
[-2J-2 2J2].complexPlot { :z |
	z + (1 / z)
}
~~~

![](sw/spl/Help/Image/complexPlot-F.png)

The following plot shows a function with simple zeros,
a double pole,
and a saddle point:

~~~spl png=G
[-2J-2 2J2].complexPlot { :z |
	(10 * ((z ^ 2) + (2 * z) + 2))
	/
	((z - 1) ^ 2)
}
~~~

![](sw/spl/Help/Image/complexPlot-G.png)

Plot complex functions of a complex variable:

~~~spl png=H
[-3.j(-2.pi), 3.j(2.pi)].complexPlot { :z |
	z.cos
}
~~~

![](sw/spl/Help/Image/complexPlot-H.png)

Plot features of a complex function of a complex variable,
here indicating a triple zero,
simple zeros,
a simple pole,
a double pole,
and an essential singularity:

~~~spl png=I
[-2J-2 2J2].complexPlot { :z |
	(
		((z + 1 + 0J1) ^ 3)
		*
		((z ^ 2) + 1)
		*
		(3 / z).exp
	)
	/
	(((z - 1) ^ 2) * (z + 1))
}
~~~

![](sw/spl/Help/Image/complexPlot-I.png)

Plot a complex function with zeros at poles:

~~~spl png=J
[-2J-2 2J2].complexPlot { :z |
	let zSquared = z * z;
	(zSquared + 1) / (zSquared - 1)
}
~~~

![](sw/spl/Help/Image/complexPlot-J.png)

Plot over non-square complex domain:

~~~spl png=K
[-2J-2 3J3].complexPlot { :x |
	((x.square - 1) * (x - 2 - 1I).square)
	/
	(x.square + 2 + 2I)
}
~~~

![](sw/spl/Help/Image/complexPlot-K.png)

Complex plot of _z³-1_:

~~~spl png=L
[-2J-2 2J2].complexPlot { :z |
	(z ^ 3) - 1
}
~~~

![](sw/spl/Help/Image/complexPlot-L.png)

Contour plot of the absolute value of _z³-1_:

~~~spl svg=M
let i = (-2 -- 2).discretize(50);
{ :x :y |
	let z = Complex(x, y);
	((z ^ 3) - 1).abs
}.contourPlot(i, i, [0.5 1 1.5])
~~~

![](sw/spl/Help/Image/complexPlot-M.svg)

Contour plot of the argument of _z³-1_:

~~~spl svg=N
let i = (-2 -- 2).discretize(25);
{ :x :y |
	let z = Complex(x, y);
	((z ^ 3) - 1).arg
}.contourPlot(i, i, [-1/2.pi 1/2.pi])
~~~

![](sw/spl/Help/Image/complexPlot-N.svg)

* * *

See also: arg, complexListPlot, Complex

Guides: Complex Number Functions, Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ComplexPlot.html),
_W_
[1](https://en.wikipedia.org/wiki/Domain_coloring)
[2](https://en.wikipedia.org/wiki/Color_wheel)
