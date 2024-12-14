# arcSin

- _arcSin(z)_

Answers the arc sine of the complex number _z_.

`SmallFloat` arguments:

```
>>> 1.arcSin
0.5.pi

>>> 0.4.arcSin
0.41152
```

`Complex` arguments:

```
>>> 1.5j0.arcSin
1.5708j-0.96242

>>> 2.5j1.arcSin
1.16462j1.65869
```

Threads elementwise over lists:

```
>>> [0.2 0.5 0.8].arcSin
[0.20136 0.52360 0.92730]
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
(-0.95 -- 0.95).functionPlot(arcSin:/1)
~~~

![](sw/spl/Help/Image/arcSin-A.svg)

* * *

See also: arcCos, cos, sin, tan

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseSine.html)
[2](https://reference.wolfram.com/language/ref/ArcSin.html),
_Smalltalk_
5.6.7.3

Categories: Math, Trigonometry
