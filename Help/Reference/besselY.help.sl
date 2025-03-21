# besselY

- _besselY(n, z)_

Answer the Bessel function of the second kind.

Evaluate numerically:

```
>>> 0.besselY(2.5)
0.498070

>>> 0.besselY(1)
0.088257
```

Plot over a subset of the reals:

~~~spl svg=A
(0.1 -- 15).functionPlot { :z |
	0.besselY(z)
}
~~~

![](sw/spl/Help/Image/besselY-A.svg)

* * *

See also: besselI, besselJ

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BesselFunctionoftheSecondKind.html)
[2](https://reference.wolfram.com/language/ref/BesselY.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/bessely.html)
