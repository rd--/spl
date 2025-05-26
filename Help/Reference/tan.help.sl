# tan

- _tan(aNumber)_

Answers the tangent of _aNumber_.

```
>>> 1/6.pi.tan
1 / 3.sqrt

>>> 30.degree.tan
1 / 3.sqrt

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

>>> (0.5 - (10 ^ [-3 .. -6])).pi.tan
318.31 * (10 ^ [0 .. 3])
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 2.pi).functionPlot { :x |
	x.tan.clip(-6, 6)
}
~~~

![](sw/spl/Help/Image/tan-A.svg)

Plot `tan` alongside a Padé approximation:

~~~spl svg=B
(-0.5.pi -- 0.5.pi).functionPlot([
	{ :x | x.tan.clip(-3, 3) },
	{ :x | x.tanApproximation.clip(-3, 3) }
])
~~~

![](sw/spl/Help/Image/tan-B.svg)

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
