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

~~~
let a = 0.5;
let b = (0.025, 0.050 .. 3);
a.beta(b).plot
~~~

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
