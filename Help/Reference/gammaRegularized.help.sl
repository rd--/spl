# gammaRegularized

- _gammaRegularized(a, z)_
- _gammaRegularized(a, 0, z)_

Answer the regularized incomplete gamma function.
The two argument form answers the upper incomplete gamma function,
the three argument form answers the lower incomplete gamma function.

Evaluate regularized (upper incomplete) gamma function numerically:

```
>>> 1.0.gammaRegularized(1.5)
0.22313

>>> 2.0.gammaRegularized(3.3)
0.158598
```

Plot regularized (upper incomplete) gamma function:

~~~spl svg=A
(0.0 -- 3.0).functionPlot(
	[1.0 2.0 3.0].collect { :a |
		{ :z |
			a.gammaRegularized(z)
		}
	}
)
~~~

![](Help/Image/gammaRegularized-A.svg)

Plot regularized (lower incomplete) gamma function:

~~~spl svg=B
(0.0 -- 10.0).functionPlot(
	[0.5 1.0 1.5 2.0 5.0].collect { :a |
		{ :x |
			a.gammaRegularized(0.0, x)
		}
	}
)
~~~

![](Help/Image/gammaRegularized-B.svg)

* * *

See also: betaRegularized, gamma

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GammaRegularized.html)
