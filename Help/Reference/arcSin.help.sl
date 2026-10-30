# arcSin

- _arcSin(z)_

Answers the arc sine of the complex number _z_.
The arc sine is the inverse sine function.

`SmallFloat` arguments:

```
>>> 1.arcSin
0.5.pi

>>> 0.4.arcSin
0.41152

>>> 1.5.arcSin
1.5708J-0.96242
```

At `Fraction`:

```
>>> 1/3.arcSin
0.3398369
```

`Complex` arguments:

```
>>> 2.5J1.arcSin
1.16462J1.65869
```

Compare accuracy of method to the direct evaluation of the logarithmic formula:

```
>>> let z = 0J-12345;
>>> z.arcSin
0J-10.114153584

>>> let z = 0J-12345;
>>> ((1 - z.square).sqrt - (z * 1I)).log * 1I
0J-10.114153587
```

Threads elementwise over lists:

```
>>> [0.2 0.5 0.8].arcSin
[0.20136 0.52360 0.92730]

>>> [-1 -0.5 0.5 1].arcSin
1.pi / [-2 -6 6 2]
```

Zero of `arcSin`:

```
>>> 0.arcSin
0
```

Inverse is `sin`:

```
>>> let n = system.nextRandomFloat;
>>> n.arcSin.sin
n
```

Plot over a subset of the reals:

~~~spl svg=A
(-0.95 -- 0.95).functionPlot(arcSin/1)
~~~

![](Help/Image/arcSin-A.svg)

Plot over a subset of the complexes:

~~~spl png=B
[-4J-2 2J2].complexPlot(arcSin/1)
~~~

![](Help/Image/arcSin-B.png)

Plot `arcSin` at integer points:

~~~spl svg=C
{ :x :y |
	(x * y).J(0).arcSin.abs.fractionalPart
}.table(-20:20, -20:20).matrixPlot
~~~

![](Help/Image/arcSin-C.svg)

* * *

See also: arcCos, cos, sin, tan

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseSine.html)
[2](https://reference.wolfram.com/language/ref/ArcSin.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.asin.html),
_Smalltalk_
5.6.7.3
