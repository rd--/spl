# arg

- _arg(z)_

Answers the argument of _z_,
the phase angle in radians between -pi and +pi.
`arg` is an alias for `argument`.

The answer is given in radians:

At `SmallFloat`:

```
>>> -1.arg
1.pi

>>> -123.arg
1.pi

>> NaN.arg
NaN
```

At `Complex`:

```
>>> 1J1.arg
1/4.pi

>>> 0.5J1.arg
1.10715

>>> 123J-456.arg
-1.3073
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

>>> [1/2 -1; -5/3 1/2].arg
[0 1.pi; 1.pi 0]

>>> [2I -1/3 1].arg
[1/2.pi 1.pi 0]
```

Values at `zero` & `Infinity`:

```
>>> [-Infinity 0 Infinity].arg
[1.pi 0 0]

>>> 0J0.arg
0
```

Polar decomposition of a complex number:

```
>>> (1J3.abs, 1J3.arg)
(10.sqrt, 3.arcTan)
```

Evaluate for complex exponentials:

```
>>> 1:8.collect { :k |
>>> 	k.I * 3.pi / 8
>>> }.exp.arg
[3/8 3/4 -7/8 -1/2 -1/8 1/4 5/8 1/1].pi
```

Plot over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot(arg/1)
~~~

![](Help/Image/arg-A.svg)

Plot _arg(x+i)_ on the reals:

~~~spl svg=B
(-3 -- 3).functionPlot { :x |
	(x + 1I).arg
}
~~~

![](Help/Image/arg-B.svg)

* * *

See also: Complex, abs, absArg, arcTan, conjugate, toPolarCoordinates

Guides: Complex Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ComplexArgument.html)
[2](https://reference.wolfram.com/language/ref/Arg.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/angle.html),
_W_
[1](https://en.wikipedia.org/wiki/Argument_(complex_analysis))

Categories: Complex
