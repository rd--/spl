# unaryFunction

- _unaryFunction(x)_

Answer a unary `Function` form of the object _x_.

At `UnivariatePolynomial`,
answer a block that evaluates the polynomial:

~~~spl svg=A
(-1.0 -- 1.0).functionPlot(
	Polynomial(
		[0 -7 0 56 0 -112 0 64]
	).unaryFunction
)
~~~

![](Help/Image/unaryFunction-A.svg)

At `Record`:

```
>>> let f/1 = (x: 1, y: 2).unaryFunction;
>>> (f('x'), f('y'))
(1, 2)
```

At `Map`:

```
>>> let f/1 = Map[
>>> 	1 -> 'x', 2 -> 'y'
>>> ].unaryFunction;
>>> (f(1), f(2))
('x', 'y')
```

At `List`:

```
>>> let f/1 = 1:9.square.unaryFunction;
>>> (f(3), f(7))
(9, 49)
```

At `Function`, identity:

```
>>> let f = { :x | x + 1 };
>>> f/1.unaryFunction == f/1
true

>>> let f/2 = { :x :y | x * y };
>>> f/2.binaryFunction == f/2
true
```

* * *

See also: AxonometricProjection, BivariatePolynomial, Function, ColourGradient, Piecewise, UnivariatePolynomial

Guides: Function Functions
