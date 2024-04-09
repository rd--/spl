# bernsteinBasis

- _bernsteinBasis(d, n, x)_

Answer the _n_-th Bernstein basis function of degree _d_ at _x_.

Evaluate a Bernstein basis polynomial numerically:

```
>>> 4.bernsteinBasis(3, 0.5)
0.25
```

Plot:

~~~
(0 -- 1).discretize(500).collect { :x | 4.bernsteinBasis(3, x) }.plot
~~~

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BernsteinPolynomial.html)
[2](https://reference.wolfram.com/language/ref/BernsteinBasis.html)
