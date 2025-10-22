# ellipticPi

- _ellipticPi(n, m)_

Answer the complete elliptic integral of the third kind _E(m)_.

At specific values:

```
>>> 0.4.ellipticPi(0.6)
2.590921

>>> 0.3.ellipticPi(0.4)
2.148795

>>> 0.5.ellipticPi(0.6)
2.867519
```

At `zero`:

```
>>> 0.ellipticPi(0)
1/2.pi
```

The total arc length of Freeth’s nephroid,
OEIS [A138498](http://oeis.org/A138498):

```
>>> let k = 2 / 3;
>>> let a = 3 * ellipticE(k);
>>> let b = 3 * ellipticK(k);
>>> let c = 4 * ellipticPi(-1/3, k);
>>> 8 * (a - b + c) / 3.sqrt
21.203406
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 1).functionPlot { :n |
	n.ellipticPi(0.6).clip([0 10])
}
~~~

![](sw/spl/Help/Image/ellipticPi-A.svg)

* * *

See also: ellipticE, ellipticK

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EllipticIntegraloftheThirdKind.html)
[2](https://reference.wolfram.com/language/ref/EllipticPi.html),
_W_
[1](https://en.wikipedia.org/wiki/Elliptic_integral)
