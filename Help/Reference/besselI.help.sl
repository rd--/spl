# besselI

- _besselI(n, z)_

Answer the modified Bessel function of the first kind.

Evaluate numerically:

```
>>> 0.besselI(2)
2.2795
```

Continued fraction with arithmetic progression terms:

```
>>> let p = 1.besselI(2);
>>> let q = 2.besselI(2);
>>> (p / q).continuedFraction(6)
[2 3 4 5 6 7]
```

Plot over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot { :x |
	0.besselI(x)
}
~~~

![](sw/spl/Help/Image/besselI-A.svg)

* * *

See also: besselJ, besselY

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ModifiedBesselFunctionoftheFirstKind.html)
[2](https://reference.wolfram.com/language/ref/BesselI.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/besseli.html)
