# ellipticK

- _ellipticK(m)_

Answer the complete elliptic integral of the first kind.

Evaluate numerically:

```
>>> 0.5.ellipticK
1.85407

>>> 0.8.ellipticK
2.25721

>>> 0.ellipticK
1/2.pi
```

Plot over a subset of the reals:

~~~spl svg=A
(-1 -- 1).functionPlot { :m |
	m.ellipticK.clip([1.2 2.6])
}
~~~

![](sw/spl/Help/Image/ellipticK-A.svg)

Plot the small-angle approximation to the period of a pendulum versus the initial angle:

~~~spl svg=B
(0 -- 1.pi).functionPlot { :alpha |
	(alpha / 2).sin.square
	.ellipticK
	.clip([1/2.pi 4])
}
~~~

![](sw/spl/Help/Image/ellipticK-B.svg)

Probability that a random walker in a cubic lattice returns to the origin:

```
>>> let a = (1.pi ^ 2) / 72;
>>> let b = 6 + (2 * 3.sqrt) + 6.sqrt;
>>> let c = (
>>> 	35 + (24 * 2.sqrt) -
>>> 	(20 * 3.sqrt) - (14 * 6.sqrt)
>>> );
>>> 1 - (a * b * (c.ellipticK ^ -2))
0.340537
```

* * *

See also: arithmeticGeometricMean

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CompleteEllipticIntegraloftheFirstKind.html)
[2](https://reference.wolfram.com/language/ref/EllipticK.html)
_W_
[1](https://en.wikipedia.org/wiki/Elliptic_integral)
