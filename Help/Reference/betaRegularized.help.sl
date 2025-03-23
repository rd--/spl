# betaRegularized

- _betaRegularized(z, a, b)_

Evaluate numerically:

```
>>> (19 / 90).betaRegularized(5, 1)
0.00041933
```

Plot over a subset of the reals:

~~~
(0 -- 1).functionPlot(
	[0.5 5; 1 3; 8 8; 3 1; 5 0.5].collect { :p |
		let [a, b] = p;
		{ :z |
			z.betaRegularized(a, b)
		}
	}
)
~~~

* * *

See also: beta

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RegularizedBetaFunction.html)
[2](https://reference.wolfram.com/language/ref/BetaRegularized.html),
_W_
[1](https://en.wikipedia.org/wiki/Beta_function)
