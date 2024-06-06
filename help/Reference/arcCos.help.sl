# arcCos

- _arcCos(z)_

Answers the arc cosine of the complex number _z_.

`SmallFloat` arguments:

```
>>> 0.arcCos
0.5.pi

>>> 0.4.arcCos
1.15928
```

`Complex` arguments:

```
>>> 1.5j0.arcCos
0j0.96242

>>> 2.5j1.arcCos
0.40617j1.65869
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

Plot over a subset of the reals:

~~~
(-0.95 -- 0.95).functionPlot(arcCos:/1)
~~~

* * *

See also: arcCosh, arcSin, cos, sin, tan

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseCosine.html)
[2](https://reference.wolfram.com/language/ref/ArcCos.html),
_Smalltalk_
5.6.7.2

Categories: Math, Trigonometry
