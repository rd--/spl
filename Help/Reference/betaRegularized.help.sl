# betaRegularized

- _betaRegularized(z, a, b)_

Answer the regularized incomplete beta function.

Evaluate numerically:

```
>>> (19 / 90).betaRegularized(5, 1)
0.00041933
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 1).functionPlot { :z |
	z.betaRegularized(3, 1).clip([-20 20])
}
~~~

![](sw/spl/Help/Image/betaRegularized-A.svg)

Plot over a subset of the reals,
with varying _a_ and _b_:

~~~spl svg=B
(0 -- 1).functionPlot(
	[0.5 5; 1 3; 8 8; 3 1; 5 0.5].collect { :p |
		let [a, b] = p;
		{ :z |
			z.betaRegularized(a, b)
		}
	}
)
~~~

![](sw/spl/Help/Image/betaRegularized-B.svg)

_Note_:
Only defined for _z_ in _(0,1)_ and integer _a_ and _b_.

* * *

See also: beta

Guides: Sigmoid Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RegularizedBetaFunction.html)
[2](https://reference.wolfram.com/language/ref/BetaRegularized.html),
_W_
[1](https://en.wikipedia.org/wiki/Beta_function)
