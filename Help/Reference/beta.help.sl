# beta

- _beta(a, b)_

Answer the Euler beta function.

At specific exact values:

```
>>> 5.beta(4)
(1 / 280)

>>> (5 / 2).beta(7 / 2)
(3.pi / 256)
```

At specific real values:

```
>>> 2.3.beta(3.2)
0.0540298

>>> 1.1.beta(2.1)
0.4107217

>>> 2.2.beta(3.3)
0.0564857
```

Threads elementwise over lists:

```
>>> 2.beta(2:5)
[6 12 20 30]./
```

Plot over a subset of the reals:

~~~spl svg=A
(0.025 -- 3).functionPlot { :x |
	0.5.beta(x)
}
~~~

![](sw/spl/Help/Image/beta-A.svg)

* * *

See also: binomial, gamma, logGamma

References:
_Dlmf_
[1](https://dlmf.nist.gov/5.12),
_Mathematica_
[1](https://mathworld.wolfram.com/BetaFunction.html)
[2](https://reference.wolfram.com/language/ref/Beta.html),
_W_
[1](https://en.wikipedia.org/wiki/Beta_function)
