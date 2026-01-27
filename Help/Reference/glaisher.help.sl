# glaisher

- _glaisher(n)_

Answer _n_ times Glaisher’s constant _A_.
also known as the Glaisher–Kinkelin constant.

```
>>> 1.glaisher
1.282427
```

Derivative of ζ at negative two:

```
>>> let a = 1.glaisher;
>>> let gamma = 1.eulerGamma;
>>> let x = (12 * a.log) - gamma - 2.pi.log;
>>> 1/6 * 1.pi.square * x
0.937548
```

Continued fraction:

```
>>> 1.glaisher.continuedFraction(16)
[1 3 1 1 5 1 1 1 3 12 4 1 271 1 1 2]
```

Scatter plot of the digits:

~~~spl svg=A
1.glaisher(109)
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/glaisher-A.svg)

* * *

See also: exp, zeta

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Glaisher-KinkelinConstant.html)
[2](https://reference.wolfram.com/language/ref/Glaisher.html),
_OEIS_
[1](https://oeis.org/A074962),
_W_
[1](https://en.wikipedia.org/wiki/Glaisher%E2%80%93Kinkelin_constant)
