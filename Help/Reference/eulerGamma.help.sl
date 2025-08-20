# eulerGamma

- _eulerGamma(n)_

_1.eulerGamma_ is Euler’s constant γ,
also called the Euler–Mascheroni constant,
with numerical value ~0.5772.

```
>>> 1.eulerGamma
0.5772

>>> 1 / 3.sqrt
0.57735

>>> 2.eulerGamma
1.1544

>>> 1.eulerGamma.exp
1.78107
```

γ is defined as the limiting difference between the harmonic series and the natural logarithm:

```
>>> let n = 9999;
>>> n.harmonicNumber - n.log
1.eulerGamma
```

The first few terms of the continued fraction,
OEIS [A00285](https://oeis.org/A00285):

```
>>> 1.eulerGamma.continuedFraction(19)
[0 1 1 2 1 2 1 4 3 13 5 1 1 8 1 2 4 1 1]
```

Calculate an approximation using an asymptotic formula of Negoi:

```
>>> let n = 400;
>>> let h = n.harmonicNumber;
>>> let a = (n + 1/2 + (1 / (24 * n))).log;
>>> (h, h - a)
(6.56993, 1.eulerGamma)
```

Plot approach to limit:

~~~spl svg=A
(1 .. 43).functionPlot { :n |
	n.harmonicNumber - n.log
}
~~~

![](sw/spl/Help/Image/eulerGamma-A.svg)

* * *

See also: e, meisselMertensConstant, pi

Guides: Mathematical Constants

References:
_Mathematica_
[1](http://mathworld.wolfram.com/Euler-MascheroniConstant.html)
[2](https://reference.wolfram.com/language/ref/EulerGamma.html),
_OEIS_
[1](https://oeis.org/A002852)
[2](https://oeis.org/A001620)
[3](https://oeis.org/A094640),
_W_
[1](https://en.wikipedia.org/wiki/Euler%27s_constant)

Unicode: U+03B3 γ Greek Small Letter Gamma
