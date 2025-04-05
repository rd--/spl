# sinh

- _sinh(aNumber)_

Answer the hyperbolic sine of _aNumber_.

```
>>> 1.4.sinh
1.90430
```

`sinh` can take `Complex` number inputs:

```
>>> 2.5J1.sinh
3.26894J5.16014
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].sinh
[1.50946 2.12928 2.94217]
```

Plot over a subset of the reals:

~~~spl svg=A
(-4 -- 4).functionPlot(sinh:/1)
~~~

![](sw/spl/Help/Image/sinh-A.svg)

Draw a hyperbola:

~~~spl svg=B
(-1 -- 1).parametricPlot(sinh:/1, cosh:/1)
~~~

![](sw/spl/Help/Image/sinh-B.svg)

Plot `sinh` alongside a Padé approximation:

~~~spl svg=C
(-1.pi -- 1.pi).functionPlot([
	sinh:/1,
	sinhApproximation:/1
])
~~~

![](sw/spl/Help/Image/sinh-C.svg)

Plot over a subset of the complexes:

~~~spl png=D
[-0.25.pi.j(-2.5), 0.25.pi.j(2.5)]
.complexPlot(sinh:/1)
~~~

![](sw/spl/Help/Image/sinh-D.png)

* * *

See also: arcSinh, cosh, csch, sin

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HyperbolicSine.html)
[2](https://reference.wolfram.com/language/ref/Sinh.html)

Categories: Math, Trigonometry
