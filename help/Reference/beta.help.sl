# beta

- _beta(a, b)_

Answer the Euler beta function.

Exact values:

```
>>> 5.beta(4)
(1 / 280)

>>> (5 / 2).beta(7 / 2)
(3.pi / 256)

>>> 2.3.beta(3.2)
0.0540298

>>> 1.1.beta(2.1)
0.410722

>>> 2:5.collect { :b | 2.beta(b) }
[6 12 20 30]./
```

Plot over a subset of the reals:

~~~
(0.025, 0.050 .. 3).collect { :x | 0.5.beta(x) }.plot
~~~

* * *

See also: gamma, logGamma

References:
_Dlmf_
[1](https://dlmf.nist.gov/5.12),
_Mathematica_
[1](https://mathworld.wolfram.com/BetaFunction.html)
[2](https://reference.wolfram.com/language/ref/Beta.html)
