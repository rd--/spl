# tan

- _tan(x)_

Answers the tangent of the number _x_.

```
>>> 1/6.pi.tan
1 / 3.sqrt

>>> 30.degree.tan
1 / 3.sqrt

>>> 1/12.pi.tan
2 - 3.sqrt

>>> 15.degree.tan
2 - 3.sqrt

>>> 1/4.pi.tan
1
```

`tan` can take `Complex` number inputs:

```
>>> 2.5J1.tan
-0.237014J0.896438
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].tan
[2.57215 14.10142 -4.28626]

>>> (0.5 - (10 ^ [-3 -4 -5 -6])).pi.tan
318.31 * (10 ^ [0 1 2 3])
```

The inverse is `arcTan`:

```
>>> 1.tan.arcTan
1
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 2.pi).functionPlot { :x |
	x.tan.clip([-6 6])
}
~~~

![](Help/Image/tan-A.svg)

Plot `tan` alongside a Padé approximation:

~~~spl svg=B
(-0.5.pi -- 0.5.pi).functionPlot(
	[
		{ :x |
			x.tan.clip([-3 3])
		},
		{ :x |
			x.tanApproximation
			.clip([-3 3])
		}
	]
)
~~~

![](Help/Image/tan-B.svg)

_|⌊(tan(n))_,
unsigned variant of
OEIS [A000503](https://oeis.org/A000503):

~~~spl svg=C oeis=A000503 variant
0:150.tan.floor.abs.scatterPlot.log
~~~

![](Help/Image/tan-C.svg)

_⌊(tan(n))_,
OEIS [A000503](https://oeis.org/A000503):

~~~spl svg=D oeis=A000503
0:150.tan.floor.scatterPlot.logScale
~~~

![](Help/Image/tan-D.svg)

_⌊(tan(n)²)_,
OEIS [A005657](https://oeis.org/A005657):

~~~spl svg=E oeis=A005657
0:150.tan.square.floor.scatterPlot.log
~~~

![](Help/Image/tan-E.svg)

* * *

See also: arcTan, cos, sin, tanh

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Tangent.html)
[2](https://reference.wolfram.com/language/ref/Tan.html),
_Smalltalk_
5.6.7.14

Categories: Trigonometry, Math
