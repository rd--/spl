# arcCos

- _arcCos(z)_

Answers the arc cosine of the complex number _z_ in radians.
The arc cosine is the inverse cosine function.

`SmallFloat` arguments:

```
>>> 0.arcCos
0.5.pi

>>> 0.4.arcCos
1.15928
```

`Complex` arguments:

```
>>> 1.5J0.arcCos
0J0.96242

>>> 2.5J1.arcCos
0.40617J1.65869
```

Threads elementwise over lists:

```
>>> [0.2 0.5 0.8].arcCos
[1.36944 1.04720 0.64350]
```

Zero of `arcCos`:

```
>>> 1.arcCos
0
```

The inverse is `cos`:

```
>>> let n = system.nextRandomFloat;
>>> n.arcCos.cos
n
```

Find the angle between two vectors:

```
>>> [1 1].normalize
>>> .dot([-1 1].normalize)
>>> .arcCos
0.5.pi
```

Plot over a subset of the reals:

~~~spl svg=A
(-0.95 -- 0.95).functionPlot(arcCos:/1)
~~~

![](sw/spl/Help/Image/arcCos-A.svg)

Plot over a subset of the complexes:

~~~spl png=B
[-4J-2 2J2].complexPlot(arcCos:/1)
~~~

![](sw/spl/Help/Image/arcCos-B.png)

Phyllotaxis pattern:

~~~spl svg=C
1:1000.collect { :i |
	[
		1,
		i.goldenAngle.mod(2.pi, -1.pi),
		(1 - (i / 1000)).arcCos
	].fromSphericalCoordinates.Point
}.PerspectiveDrawing
~~~

![](sw/spl/Help/Image/arcCos-C.svg)

* * *

See also: arcCosh, arcSin, cos, sin, tan

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseCosine.html)
[2](https://reference.wolfram.com/language/ref/ArcCos.html),
_Smalltalk_
5.6.7.2

Categories: Math, Trigonometry
