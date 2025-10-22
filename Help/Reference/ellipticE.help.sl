# ellipticE

- _ellipticE(m)_

Answer the complete elliptic integral of the second kind _E(m)_.

At specific values:

```
>>> 0.4.ellipticE
1.3994

>>> 0.123456789.ellipticE
1.5211

>>> -1.ellipticE
1.9101
```

At `one` and `zero`:

```
>>> 0.ellipticE
1/2.pi

>>> 1.ellipticE
1
```

At `Fraction`:

```
>>> 1/3.ellipticE
1.4303

>>> 2/3.ellipticE
1.2612
```

Threads over lists:

```
>>> [1 0; 0 1].ellipticE
[1 1/2.pi; 1/2.pi 1]
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 1).functionPlot(ellipticE:/1)
~~~

![](sw/spl/Help/Image/ellipticE-A.svg)

* * *

See also: ellipticK

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EllipticIntegraloftheSecondKind.html)
[2](https://reference.wolfram.com/language/ref/EllipticE.html),
_W_
[1](https://en.wikipedia.org/wiki/Elliptic_integral)

Further Reading: Garrett 1963
