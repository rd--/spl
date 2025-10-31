# asBlock

- _asBlock(x)_

Answer a `Block` form of the object _x_.

At `Block`, identity:

```
>>> { :x | x + 1 }.asBlock.value(1)
2
```

At `UnivariatePolynomial`,
answer a block that evaluates the polynomial:

~~~spl svg=A
(-1 -- 1).functionPlot(
	Polynomial(
		[0 -7 0 56 0 -112 0 64]
	).asBlock
)
~~~

* * *

See also: BivariatePolynomial, ColourGradient, UnivariatePolynomial

Guides: Block Functions
