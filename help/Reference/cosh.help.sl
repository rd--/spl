# cosh

_cosh(aNumber)_

Answer the hyperbolic cosine of _aNumber_.

```
>>> 1.2.cosh
1.81066
```
Cosh can take complex number inputs:

```
>>> 2.5j1.cosh
3.31329j5.09107
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].cosh
[1.81066 2.35241 3.10747]
```

Value at infinity:

```
>>> inf.cosh
inf
```

Minimum of _cosh_:

```
0.cosh
1
```

Plot over a subset of the reals:

```
(-4, -3.99 .. 4).cosh.plot
```

* * *

See also: arcCosh, cos, sin, sech, sinh

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HyperbolicCosine.html)
[2](https://reference.wolfram.com/language/ref/Cosh.html)
