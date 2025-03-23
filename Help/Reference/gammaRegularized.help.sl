# gammaRegularized

- _gammaRegularized(a, z)_
- _gammaRegularized(a, 0, z)_

Answer the regularized incomplete gamma function.
The two argument form answers the upper incomplete gamma function,
the three argument form answers the lower incomplete gamma function.

Evaluate regularized (upper incomplete) gamma function numerically:

```
>>> 1.gammaRegularized(1.5)
0.22313

>>> 2.gammaRegularized(3.3)
0.158598
```

Plot regularized (upper incomplete) gamma function:

~~~spl svg=A
(0 -- 3).functionPlot(
	[1 2 3].collect { :a |
		{ :z |
			a.gammaRegularized(z)
		}
	}
)
~~~

![](sw/spl/Help/Image/gammaRegularized-A.svg)

Plot regularized (lower incomplete) gamma function:

~~~spl svg=B
(0 -- 10).functionPlot(
	[0.5 1 1.5 2 5].collect { :a |
		{ :x |
			a.gammaRegularized(0, x)
		}
	}
)
~~~

![](sw/spl/Help/Image/gammaRegularized-B.svg)

* * *

See also: betaRegularized, gamma

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GammaRegularized.html)
