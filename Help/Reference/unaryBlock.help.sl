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

At `Record`:

```
>>> let f/1 = (x: 1, y: 2).unaryBlock;
>>> (f('x'), f('y'))
(1, 2)
```

At `Map`:

```
>>> let f/1 = Map[
>>> 	1 -> 'x', 2 -> 'y'
>>> ].unaryBlock;
>>> (f(1), f(2))
('x', 'y')
```

At `List`:

```
>>> let f/1 = 1:9.square.unaryBlock;
>>> (f(3), f(7))
(9, 49)
```

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

See also: AxonometricProjection, BivariatePolynomial, Block, ColourGradient, Piecewise, UnivariatePolynomial

Guides: Block Functions
