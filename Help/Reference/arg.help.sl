# arg

- _arg(z)_

Answers the argument of _z_, the phase angle in radians between -pi and +pi.

The answer is given in radians:

At `SmallFloat`:

```
>>> -1.arg
pi
```

At `Complex`:

```
>>> 1j1.arg
(pi / 4)

>>> 0.5j1.arg
1.10715
```

Real numbers are a special kind of complex number:

```
>>> -0.5.arg
pi

>>> 3.arg
0
```

Threads elementwise over lists and matrices:

```
>>> [1.2 0j1.5 0j-1.8].arg
[0 1.5708 -1.5708]
```

Values at `zero` & infinity:

```
>>> [0 inf].arg
[0 0]
```

Polar decomposition of a complex number:

```
>>> (1j3.abs, 1j3.arg)
(10.sqrt, 3.arcTan)
```

Plot over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot(arg:/1)
~~~

![](sw/spl/Help/Image/arg-A.svg)

Plot _arg(x + i)_ on the reals:

~~~spl svg=B
(-3 -- 3).functionPlot { :x | (x + 1.i).arg }
~~~

![](sw/spl/Help/Image/arg-B.svg)

* * *

See also: abs, absArg, arcTan, conjugated, Complex, toPolarCoordinates

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Arg.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/angle.html)

Categories: Complex
