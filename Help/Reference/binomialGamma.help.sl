# binomialGamma

- _binomialGamma(n, k)_

Answer the binomial coefficient,
calculated using the `gamma` function,
allowing for real _n_ and _k_.

Fractional _k_:

```
>>> binomialGamma(2, 0.5)
16 / 3.pi
```

At _k=0_:

```
>>> binomialGamma([-3 .. 3], 0)
[1 1 1 1 1 1 1]
```

At _n=0_:

```
>>> binomialGamma(0, [-3 .. 3])
[0 0 0 1 0 0 0]
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

Plot the binomial as a function of its parameter _n_:

~~~spl svg=A
(-1.75 -- 4).functionPlot(
	[1 2 3 4].collect { :k |
		{ :n |
			binomialGamma(n, k)
		}
	}
)
~~~

![](Help/Image/binomialGamma-A.svg)

Plot the binomial as a function of its parameter _k_:

~~~spl svg=B
(-1 -- 5).functionPlot(
	[1 2 3 4].collect { :n |
		{ :k |
			binomialGamma(n, k)
		}
	}
)
~~~

![](Help/Image/binomialGamma-B.svg)

Binomial coefficients modulo two:

~~~spl svg=C
1:17.triangularArray { :n :k |
	binomialGamma(n, k) % 2
}.padRight.matrixPlot
~~~

![](Help/Image/binomialGamma-C.svg)

Binomial coefficients modulo π:

~~~spl svg=D
1:21.triangularArray { :n :k |
	binomialGamma(n, k) % 1.pi
}.padRight.matrixPlot
~~~

![](Help/Image/binomialGamma-D.svg)

Plot binomial at Gaussian integers:

~~~spl svg=E
{ :x :y |
	let a = binomialGamma(x.J(y), x);
	a.imaginary.round % 2
}.table(0:14, -25:25)
.matrixPlot
~~~

![](Help/Image/binomialGamma-E.svg)

Evaluate symbolically:

```
>> uncheckedBinomialGamma(`x` + 1, 2)
(/
 (gamma (+ (+ x 1) 1))
 (* 2 (gamma (+ (- (+ x 1) 2) 1))))
```

* * *

See also: binomial, binomialPascal, gamma

References:
_W_
[1](https://en.wikipedia.org/wiki/Gamma%27s_triangle)

Categories: Math, Combinatorics
