# besselK

- _besselK(n, z)_

Answer the modified Bessel function of the second kind _Kn(z)_.

Evaluate at specific real values:

```
>>> 0L.besselK(0.53)
0.87656

>>> 0L.besselK(4)
0.0111597

>>> 1L.besselK(4)
0.0124835
```

Plot _K0_ over a subset of the reals:

~~~spl svg=A
(0.5 -- 3.0).functionPlot { :x |
	0L.besselK(x)
}
~~~

![](Help/Image/besselK-A.svg)

* * *

See also: besselI, besselJ, besselY

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ModifiedBesselFunctionoftheSecondKind.html)
[2](https://reference.wolfram.com/language/ref/BesselK.html),
_W_
[1](https://en.wikipedia.org/wiki/Bessel_function)

Categories: Math
