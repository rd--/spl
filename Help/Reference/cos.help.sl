# cos

- _cos(aNumber)_

Answers the cosine of _aNumber_.

```
>>> 1/6.pi.cos
3.sqrt / 2

>>> 1/5.pi.cos
(1 + 5.sqrt) / 4

>>> 30.degree.cos
3.sqrt / 2

>>> 1.2.cos
0.362358
```

`cos` can take `Complex` number inputs:

```
>>> 2.5J1.cos
-1.23623J-0.70333
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].cos
[0.36236 0.07074 -0.22720]
```

Fixed point:

```
>>> 0.7390851332.cos
0.7390851332
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 2.pi).functionPlot(cos:/1)
~~~

![](sw/spl/Help/Image/cos-A.svg)

Increasing amplitude:

~~~spl svg=B
(0 -- 16.pi).functionPlot { :u | u * u.cos }
~~~

![](sw/spl/Help/Image/cos-B.svg)

Noncommensurate waves (quasiperiodic function):

~~~spl svg=C
(0 -- 16.pi).functionPlot { :x |
	x.cos + (x * 2.sqrt).cos
}
~~~

![](sw/spl/Help/Image/cos-C.svg)

Spiral:

~~~spl svg=D
(0 -- 6.pi).subdivide(200).collect { :t |
	[
		t / 1.pi * t.cos,
		t / 1.pi * t.sin
	]
}.asLineDrawing
~~~

![](sw/spl/Help/Image/cos-D.svg)

Plot `cos` alongside a Padé approximation:

~~~spl svg=E
(-1.pi -- 1.pi).functionPlot([
	cos:/1,
	cosApproximation:/1
])
~~~

![](sw/spl/Help/Image/cos-E.svg)

* * *

See also: arcCos, arcCosh, cosh, secant, sin, tan

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Cosine.html)
[2](https://reference.wolfram.com/language/ref/Cos.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.cos.html),
_Smalltalk_
5.6.7.5

Categories: Math, Trigonometry
