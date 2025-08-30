# arcCosh

- _arcCosh(z)_

Answer the inverse hyperbolic cosine of _z_.

```
>>> 1.5.arcCosh
0.96242

>>> 2.arcCosh
1.31696
```

Inverse is cosh:

```
>>> 2.arcCosh.cosh
2
```

At `Complex`:

```
>>> 1.5J1.arcCosh
1.26048J0.66442
```

Threads over lists:

```
>>> [1 2 3 1.pi].arcCosh
[0 1.31696 1.76275 1.81153]

>>> [-2 .. 2].halve.arcCosh
[1.pi.i, 2.pi.i / 3, 1.pi.i / 2, 1.pi.i / 3, 0]
```

At `Infinity`:

```
>>> Infinity.arcCosh
Infinity
```

Zero of `arcCosh`:

```
>>> 1.arcCosh
0
```

Plot over a subset of the reals:

~~~spl svg=A
(1 -- 10).functionPlot(arcCosh:/1)
~~~

![](sw/spl/Help/Image/arcCosh-A.svg)

Plot of complex `arcCosh` function:

~~~spl png=B
[-2J-2 2J2].complexPlot(arcCosh:/1)
~~~

![](sw/spl/Help/Image/arcCosh-B.png)

Polar plot:

~~~spl svg=C
(1 -- 8.pi).polarPlot(arcCosh:/1)
~~~

![](sw/spl/Help/Image/arcCosh-C.svg)

Plot the real and imaginary parts:

~~~spl svg=D
(-2 -- 2).functionPlot([
	{ :x | x.arcCosh.real },
	{ :x | x.arcCosh.imaginary }
])
~~~

![](sw/spl/Help/Image/arcCosh-D.svg)

* * *

See also: arcCos, cos

Guides: Hyperbolic Functions, Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Tangent.html)
[2](https://reference.wolfram.com/language/ref/ArcCosh.html)

Categories: Math, Trigonometry
