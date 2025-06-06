# diracComb

- _diracComb(x, z=∞)_

Answer the Dirac comb function _ш(x)_ giving a delta function at every integer point,
also known as impulse train, sampling function and sha.

Dirac comb vanishes for noninteger arguments:

```
>>> 0.5.diracComb
0
```

Dirac comb is ∞ for integer arguments:

```
>>> 1.diracComb
Infinity
```

Plot over a subset of the reals:

~~~spl svg=A
(-5, -4.5 .. 5)
.collect(diracComb:/1)
.clip([0 1])
.discretePlot
~~~

![](sw/spl/Help/Image/diracComb-A.svg)

* * *

See also: diracDelta

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DiracComb.html),
_W_
[1](https://en.wikipedia.org/wiki/Dirac_comb)

Unicode: U+0428 Ш Cyrillic Capital Letter Sha, U+0448 ш Cyrillic Small Letter Sha

