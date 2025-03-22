# incompleteGamma

- _incompleteGamma(z, α)_

Answers a three element `List` telling the answers to the lower, upper and regularized-lower gamma functions.
The regularized upper gamma function is `one` minus the regularized lower gamma function.

```
>>> 1.5.incompleteGamma(1)
[0.7769 0.22313 0.7769]

>>> 1.5.incompleteGamma(2)
[0.4422 0.5578 0.4422]

>>> 3.3.incompleteGamma(2)
[0.8414 0.1586 0.8414]

>>> 0.22.incompleteGamma(2 / 5)
[1.2838 0.9344 0.5788]
```

The regularized lower incomplete gamma function is the `cdf` of the gamma distribution,
it starts at 0 and monotonically increases to 1:

```
>>> [0 0.5 1 10 100].collect { :x |
>>> 	x.incompleteGamma(0.5)
>>> }
[
	0.0000 1.7725 0.0000;
	1.2100 0.5624 0.6827;
	1.4936 0.2788 0.8427;
	1.7724 0.0000 0.9999;
	1.7725 0.0000 1.0000
]
```

Plot regularized lower incomplete gamma function:

~~~spl svg=A
(0 -- 10).functionPlot(
	[0.5 1 1.5 2 5].collect { :a |
		{ :x |
			x.incompleteGamma(a).last
		}
	}
)
~~~

![](sw/spl/Help/Image/incompleteGamma-A.svg)

* * *

See also: gamma, lowerIncompleteGamma, upperIncompleteGamma
