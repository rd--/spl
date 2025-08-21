# sec

- _sec(x)_

Answer the secant of the number _x_,
often abbreviated as _sec_.

Equal to the reciprocal of `cos`:

```
>>> 1/6.pi.sec
1 / 1/6.pi.cos
```

At `SmallFloat`:

```
>>> 1/6.pi.sec
2 / 3.sqrt
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].sec
[2.7597 14.1368 -4.4014]
```

Evaluate for complex arguments:

```
>>> 2.5J1.sec
-0.6111J0.3477
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	sec:/1.clip([-4 4])
)
~~~

![](sw/spl/Help/Image/sec-A.svg)

Plot over a subset of the complex numbers:

~~~spl png=B
let i = (-1.pi -- 1.pi).subdivide(100);
{ :y :x |
	Complex(x, y).sec.abs.clip([0 1])
}.table(i, i).Graymap
~~~

![](sw/spl/Help/Image/sec-B.png)

Plot the sum of the `sec` and `tan` functions:

~~~spl svg=C
(0 -- 4.pi).functionPlot { :x |
	(x.sec + x.tan).clip([-9 9])
}
~~~

![](sw/spl/Help/Image/sec-C.svg)

Draw an epispiral:

~~~spl svg=D
let a = 7;
(0 -- 2.pi).polarPlot { :theta |
	(a * theta).sec.clip([0 1])
}
~~~

![](sw/spl/Help/Image/sec-D.svg)

Draw a hyperbola:

~~~spl svg=E
(-1/4.pi -- 1/4.pi).functionPlot { :theta |
	[theta.sec theta.tan]
}
~~~

![](sw/spl/Help/Image/sec-E.svg)

* * *

See also: cos, cosec, sin

Guides: Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Secant.html)
[2](https://reference.wolfram.com/language/ref/Sec.html),
_W_
[1](https://en.wikipedia.org/wiki/Secant_(trigonometry))
