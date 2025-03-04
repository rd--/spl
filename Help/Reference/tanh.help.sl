# tanh

- tanh(aNumber)

Answer the hyperbolic tangent of _aNumber_.

At `SmallFloat`:

```
>>> 2.2.tanh
0.975743
```

In terms of `sinh` and `cosh`:

```
>>> let z = 2.2;
>>> z.sinh / z.cosh
z.tanh
```

`tanh` can take complex number inputs:

```
>>> 2.5J1.tanh
1.00555J0.0123221
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].tanh
[0.83365, 0.90515, 0.94681]
```

Values at `Infinity`:

```
>>> Infinity.tanh
1
```

`zero` of `tanh`:

```
>>> 0.tanh
0
```

At purely imaginary number:

```
>>> 0.2.pi.i.tanh
(5 - (2 * 5.sqrt)).sqrt.i
```

Continued fraction expansion:

```
>>> 1.tanh.continuedFraction(10)
[0 1 3 5 7 9 11 13 15 17]
```

Plot over a subset of the reals:

~~~spl svg=A
(-4 -- 4).functionPlot(tanh:/1)
~~~

![](sw/spl/Help/Image/tanh-A.svg)

Plot `tanh` alongside a Padé approximation:

~~~spl svg=B
(-1.pi -- 1.pi).functionPlot([
	tanh:/1,
	tanhApproximation:/1
])
~~~

![](sw/spl/Help/Image/tanh-B.svg)

* * *

See also: arcTanh, sinh, coth, tan

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Tanh.html)
