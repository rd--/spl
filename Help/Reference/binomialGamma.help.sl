# binomialGamma

- _binomialGamma(n, k)_

Answer the binomial coefficient,
calculated using the `gamma` function,
allowing for real _n_ and _k_.

Fractional _k_:

```
>>> 2.binomialGamma(0.5)
16 / 3.pi
```

Negative _k_:

```
>>> 1.binomialGamma(-2)
0

>>> 8.5.binomialGamma(-4.2)
0.0000604992
```

Written out:

```
>>> let n = 2;
>>> let k = 0.5;
>>> let a = (n + 1).gamma;
>>> let b = (k + 1).gamma;
>>> let c = (n - k + 1).gamma;
>>> (a, b, c, a / (b * c))
(
	2,
	1.pi.sqrt / 2,
	3/4 * 1.pi.sqrt,
	16 / 3.pi
)
```

* * *

See also: binomial, binomialPascal, gamma

References:
_W_
[1](https://en.wikipedia.org/wiki/Gamma%27s_triangle)

Categories: Math, Combinatorics
