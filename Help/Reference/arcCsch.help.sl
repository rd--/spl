# arcCsch

- _arcCsch(z)_

Answers the inverse hyperbolic secant of the complex number _z_.

`Float` arguments:

```
>>> 4.5.arcCsch
0.22043

>>> 5.0.arcCsch
0.19869

>>> 2.0.arcCsch
1.goldenRatio.log
```

At `zero`:

```
>>> 0.0.arcCsch
Infinity
```

At `Fraction`:

```
>>> 4/3.arcCsch - 2.log
0
```

Relation to `arcSinh`:

```
>>> let z = 3.0;
>>> z.arcSinh
(1.0 / z).arcCsch
```

`Complex` arguments:

```
>>> 1.5J1.0.arcCsch
0.463599J-0.281035

>>> 0J2.arcCsch
-1/6.pi.I

>>> (1J0 / 0J2).arcSinh
-1/6.pi.I

>>> 0J-2.arcCsch
1/6.pi.I

>>> (1 / 0J-2).arcSinh
1/6.pi.I

>>> -1I.pi.arcCsch
0J0.323946
```

Threads elementwise over lists:

```
>>> [2 -3].arcCsch
[0.48121 -0.32745]
```

Inverse of `csch`:

```
>>> let x = 0.35;
>>> let y = x.csch;
>>> (y, y.arcCsch)
(2.7996, 0.35)
```

Plot over a subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot { :z |
	z.arcCsch.clip(-2, 2)
}
~~~

![](Help/Image/arcCsch-A.svg)

* * *

See also: arcCsc, arcSech, arcSinh, csc

Guides: Hyperbolic Functions, Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseHyperbolicCosecant.html)
[2](https://reference.wolfram.com/language/ref/ArcCsch.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.acsch.html),
_W_
[1](https://en.wikipedia.org/wiki/Inverse_hyperbolic_cosecant)
