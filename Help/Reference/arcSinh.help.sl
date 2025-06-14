# arcSinh

- _arcSinh(z)_

Answers the inverse hyperbolic sine sine of the complex number _z_.

`SmallFloat` arguments:

```
>>> 1.5.arcSinh
1.19476

>>> 1.arcSinh
0.8814
```

`Complex` arguments:

```
>>> 1.5J0.7.arcSinh
1.2562J0.3776

>>> 0J-2.arcSinh
-1.3170J-1.5708

>>> 1J2.arcSinh
1.4694J1.0634

>>> (1J2 * 0J1).arcSin / 0J1
1.4694J1.0634
```

Threads elementwise over lists:

```
>>> [2 -3 1J2].arcSinh
[1.4436 -1.8184 1.4694J1.0634]
```

At `zero`:

```
>>> 0.arcSinh
0
```

Inverse is `sinh`:

```
>>> let n = system.nextRandomFloat;
>>> n.arcSinh.sinh
n
```

Plot over a subset of the reals:

~~~spl svg=A
(-10 -- 10).functionPlot(arcSinh:/1)
~~~

![](sw/spl/Help/Image/arcSinh-A.svg)

* * *

See also: arcSin, cos, sin, tan

Guides: Sigmoid Functions, Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseHyperbolicSine.html)
[2](https://reference.wolfram.com/language/ref/ArcSinh.html),
_W_
[1](https://en.wikipedia.org/wiki/Inverse_hyperbolic_functions)

Categories: Math, Trigonometry
