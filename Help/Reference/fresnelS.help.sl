# fresnelS

- _fresnelS(z)_

Answer an approximation of the Fresnel integral _S(z)_.

Evaluate numerically:

```
>>> 1.8.fresnelS
0.450939

>>> 2.fresnelS
0.343416

>>> 0.fresnelS
0
```

Plot over a subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot(200, fresnelS:/1)
~~~

![](sw/spl/Help/Image/fresnelS-A.svg)

* * *

See also: erf, fresnelC

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FresnelIntegrals.html)
[2](https://reference.wolfram.com/language/ref/FresnelS.html)
_W_
[1](https://en.wikipedia.org/wiki/Fresnel_integral)
