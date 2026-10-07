# unaryBlock

- _unaryBlock(x)_

Answer a unary `Block` form of the object _x_.

At `UnivariatePolynomial`,
answer a block that evaluates the polynomial:

~~~spl svg=A
(-1 -- 1).functionPlot(
	Polynomial(
		[0 -7 0 56 0 -112 0 64]
	).unaryBlock
)
~~~

![](Help/Image/unaryBlock-A.svg)

At `Block`, identity:

```
>>> let f = { :x | x + 1 };
>>> f/1.unaryBlock == f/1
true

>>> let f/2 = { :x :y | x * y };
>>> f/2.binaryBlock == f/2
true
```

* * *

See also: BivariatePolynomial, Block, ColourGradient, UnivariatePolynomial

Guides: Block Functions
