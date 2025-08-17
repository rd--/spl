# arcCsch

- _arcCsch(z)_

Answers the inverse hyperbolic secant of the complex number _z_.

`SmallFloat` arguments:

```
>>> 4.5.arcCsch
0.22043

>>> 5.arcCsch
0.19869

>>> 2.arcCsch
1.goldenRatio.log
```

Relation to `arcSinh`:

```
>>> let z = 3;
>>> z.arcSinh
(1 / z).arcCsch
```

`Complex` arguments:

```
>>> 0J2.arcCsch
-1/6.pi.i

>>> 0J-2.arcCsch
1/6.pi.i

>>> -1.pi.i.arcCsch
0J0.323946
```

Branch cut:

```
>>> 1.5J1.arcCsch
-0.463599.j(0.281035  - 1.pi)
```

Threads elementwise over lists:

```
>>> [2 -3].arcCsch
[0.48121 -0.32745]
```

Plot over a subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot { :z |
	z.arcCsch.clip([-2 2])
}
~~~

![](sw/spl/Help/Image/arcCsch-A.svg)

* * *

See also: arcCsc, arcSech, csc

Guides: Hyperbolic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseHyperbolicCosecant.html)
[2](https://reference.wolfram.com/language/ref/ArcCsch.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.acsch.html),
_W_
[1](https://en.wikipedia.org/wiki/Inverse_hyperbolic_cosecant)

Categories: Math, Trigonometry
