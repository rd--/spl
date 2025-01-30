# SymbolicExpression

- _SymbolicExpression(operand, operators)_

A `Type` representing a symbolic expression.

Symbolic expressions implement `adaptToNumberAndApply`:

```
>>> let x = 'x'.Symbol;
>>> (
>>> 	x + 23,
>>> 	3.141 / x,
>>> 	(x ^ 2) + (x ^ 3)
>>> )
(
	x + 23,
	3.141 / x,
	(x ^ 2) + (x ^ 3)
)
```

Symbolic expressions implement `Number`.
`squared` multiplies a number by itself:

```
>>> let x = 'x'.Symbol;
>>> (23 - x).squared
(23 - x) * (23 - x)
```

`Hypot` is the `sqrt` of the sum of the squares:

```
>>> let x = 'x'.Symbol;
>>> let y = 'y'.Symbol;
>>> x.Hypot(y)
((x * x) + (y * y)).sqrt
```

The `printString` of a symbolic expression is an _S-expression_:

```
>>> Hypot:/2
>>> .asSymbolicExpression(['x' 'y'])
>>> .printString
'(sqrt (+ (* x x) (* y y)))'
```

* * *

See also: asSymbolicExpression, name, printString, Symbol

Categories: Logic, Type
