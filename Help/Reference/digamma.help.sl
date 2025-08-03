# digamma

- _digamma(z)_

Answer the digamma function _ψ(z)_.

```
>>> 5.digamma
25/12 - 1.eulerGamma

>>> 100.5.digamma
4.60517

>>> 2.2.digamma
0.54429
```

Zero:

```
>>> 1.46163.digamma
0
```

At `zero`:

```
>>> 0.digamma.isFinite
false
```

At `one`:

```
>>> 0 - 1.digamma
1.eulerGamma
```

Plot over a subset of the reals:

~~~spl svg=A
(0.25 -- 3).functionPlot(digamma:/1)
~~~

![](sw/spl/Help/Image/digamma-A.svg)

* * *

See also: eulerGamma, gamma, harmonicNumber, logGamma

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/.html)
[2](https://reference.wolfram.com/language/ref/PolyGamma.html),
_W_
[1](https://en.wikipedia.org/wiki/Digamma_function)
