# arcSinh

- _arcSinh(z)_

Answers the inverse hyperbolic sine of the complex number _z_.

`Float` arguments:

```
>>> 1.5.arcSinh
1.19476

>>> 1.0.arcSinh
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

>>> let z = 0J-0.5;
>>> ((z.square + 1).sqrt + z).log
-1/6.pi.I

.arcSinh
```

At `Fraction`:

```
>>> 3/4.arcSinh - 2.log
0.0
```

Threads elementwise over lists:

```
>>> [2 -3 1J2].arcSinh
[1.4436 -1.8184 1.4694J1.0634]

>>> let n = -2:2;
>>> (n / 2).I.arcSinh
[-1/2 -1/6 0 1/6 1/2].pi.I
```

At `zero` and `Infinity`:

```
>>> 0.0.arcSinh
0.0

>>> Infinity.arcSinh
Infinity
```

Inverse is `sinh`:

```
>>> let n = system.nextRandomFloat;
>>> n.arcSinh.sinh
n
```

Plot over a subset of the reals:

~~~spl svg=A
(-10 -- 10).functionPlot(arcSinh/1)
~~~

![](Help/Image/arcSinh-A.svg)

Plot of complex `arcSinh` function:

~~~spl png=B
[-2J-2 2J2].complexPlot(arcSinh/1)
~~~

![](Help/Image/arcSinh-B.png)

Plot `arcSinh` and real part of `arcCosh`:

~~~spl svg=C
(-4 -- 4).functionPlot(
	[
		arcSinh/1,
		arcCosh/1
	]
)
~~~

![](Help/Image/arcSinh-C.svg)

Polar plot:

~~~spl svg=D
(-3.pi -- 3.pi).polarPlot(
	arcSinh/1
)
~~~

![](Help/Image/arcSinh-D.svg)

* * *

See also: arcSin, cos, sin, tan

Guides: Hyperbolic Functions, Sigmoid Functions, Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseHyperbolicSine.html)
[2](https://reference.wolfram.com/language/ref/ArcSinh.html),
_W_
[1](https://en.wikipedia.org/wiki/Inverse_hyperbolic_functions)
