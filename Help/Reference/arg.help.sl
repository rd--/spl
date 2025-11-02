# arg

- _arg(z)_

Answers the argument of _z_,
the phase angle in radians between -pi and +pi.

The answer is given in radians:

At `SmallFloat`:

```
>>> -1.arg
1.pi
```

At `Complex`:

```
>>> 1J1.arg
1/4.pi

>>> 0.5J1.arg
1.10715
```

Real numbers are a special kind of complex number:

```
>>> -0.5.arg
1.pi

>>> 3.arg
0
```

Threads elementwise over lists and matrices:

```
>>> [1.2 0J1.5 0J-1.8].arg
[0 1.5708 -1.5708]

>>> [1J1 -1J1 -1J-1 1J-1].arg
[1/4.pi 3/4.pi -3/4.pi -1/4.pi]

>>> [1J0 0J1 -1J0 0J-1].arg
[0 1/2.pi 1.pi -1/2.pi]
```

Values at `zero` & `Infinity`:

```
>>> [0 Infinity].arg
[0 0]
```

Polar decomposition of a complex number:

```
>>> (1J3.abs, 1J3.arg)
(10.sqrt, 3.arcTan)
```

Plot over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot(arg:/1)
~~~

![](sw/spl/Help/Image/arg-A.svg)

Plot _arg(x+i)_ on the reals:

~~~spl svg=B
(-3 -- 3).functionPlot { :x |
	(x + 1.i).arg
}
~~~

![](sw/spl/Help/Image/arg-B.svg)

* * *

See also: abs, absArg, arcTan, conjugate, Complex, toPolarCoordinates

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ComplexArgument.html)
[2](https://reference.wolfram.com/language/ref/Arg.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/angle.html),
_W_
[1](https://en.wikipedia.org/wiki/Argument_(complex_analysis))

Categories: Complex
