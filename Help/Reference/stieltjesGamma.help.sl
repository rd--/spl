# stieltjesGamma

- _stieltjesGamma(n)_

Answer the _n_-th the Stieltjes constant, γₙ.

```
>>> 0.stieltjesGamma
1.eulerGamma

>>> 1.stieltjesGamma
-0.072815
```

Plot values of Stieltjes gamma:

~~~spl svg=A
3:25.collect { :n |
	n.stieltjesGamma * 1E1
}.discretePlot
~~~

![](sw/spl/Help/Image/stieltjesGamma-A.svg)

* * *

See also: eulerGamma, zeta

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StieltjesConstants.html)
[2](https://reference.wolfram.com/language/ref/StieltjesGamma.html),
_W_
[1](https://en.wikipedia.org/wiki/Stieltjes_constants)
