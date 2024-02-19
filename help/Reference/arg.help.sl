# arg

_arg(aComplexNumber)_

Answers the argument of _aComplexNumber_, the phase angle in radians between -pi and +pi.

The answer is given in radians:

```
>>> -1.arg
pi

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

Values at zero & infinity:

```
>>> [0, inf].arg
[0 0]
```
Polar decomposition of a complex number:

```
>>> (1j3.abs, 1j3.arg)
(10.sqrt, 3.arcTan)
```

Plot over a subset of the reals:

```
(-3, -2.95 .. 3).arg.plot
```

Plot _arg(x + i)_ on the reals:

```
(-3, -2.95 .. 3).collect { :x | x.j(1).arg }.plot
```

* * *

See also: abs, absArg, arcTan, conjugated, Complex, toPolarCoordinates

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Arg.html)
