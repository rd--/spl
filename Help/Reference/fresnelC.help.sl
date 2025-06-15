# fresnelC

- _fresnelC(z)_

Answer an approximation of the Fresnel integral _C(z)_.

Evaluate numerically:

```
>>> 1.8.fresnelC
0.333633

>>> 2.fresnelC
0.488253406075

>>> 0.fresnelC
0
```

Plot over a subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot(200, fresnelC:/1)
~~~

![](sw/spl/Help/Image/fresnelC-A.svg)

Intensity of a wave diffracted by a half-plane:

~~~spl svg=B
(-2 -- 4).functionPlot { :d |
	let a = 0.5 * ((d.fresnelS + 0.5) ^ 2);
	let b = 0.5 * ((d.fresnelC + 0.5) ^ 2);
	a + b
}
~~~

![](sw/spl/Help/Image/fresnelC-B.svg)

Plot a Cornu, or Euler, spiral, also called a clothoid:

~~~spl svg=C
(-4 -- 4).discretize(100) { :x |
	[x.fresnelC, x.fresnelS]
}.Line.asLineDrawing
~~~

![](sw/spl/Help/Image/fresnelC-C.svg)

Plot _C(t)/S(t)_:

~~~spl svg=D
(0.5 -- 5).functionPlot { :x |
	x.fresnelC / x.fresnelS
}
~~~

![](sw/spl/Help/Image/fresnelC-D.svg)

Plot _S(t)/C(t)_:

~~~spl svg=E
(1E-3 -- 5).functionPlot { :x |
	x.fresnelS / x.fresnelC
}
~~~

![](sw/spl/Help/Image/fresnelC-E.svg)

* * *

See also: erf, fresnelS

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FresnelIntegrals.html)
[2](https://reference.wolfram.com/language/ref/FresnelC.html)
_W_
[1](https://en.wikipedia.org/wiki/Fresnel_integral)
