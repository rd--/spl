# SymbolicExpression

- _SymbolicExpression(operand, operators)_

A `Type` representing a symbolic expression.
The `printString` of a symbolic expression is an _S-expression_.

`SymbolicExpression` implements `=` and `~` symbolically:

```
>>> let x = 'x'.Symbol;
>>> let y = 'y'.Symbol;
>>> (
>>> 	(x = y).isSymbolicExpression,
>>> 	(x = y).operator.name,
>>> 	(x = y).printString,
>>> 	(x ~ y).printString,
>>> 	(x / 2 ~ 0).printString
>>> )
(
	true,
	'=',
	'(= x y)',
	'(~ x y)',
	'(~ (/ x 2) 0)'
)
```

`isEqualSymbolicExpression` tests if two `SymbolicExpression` values are the same:

```
>>> let a = ('x'.Symbol + 3.141);
>>> let b = ('y'.Symbol * 1.618);
>>> { :i :j |
>>> 	i.isEqualSymbolicExpression(j)
>>> }.table([a, b], [a, b])
[true false; false true]
```

Symbolic expressions implement `adaptToNumberAndApply`:

```
>>> let x = 'x'.Symbol;
>>> [
>>> 	x + 23,
>>> 	3.141 / x,
>>> 	(x ^ 2) + (x ^ 3)
>>> ].collect(printString:/1)
[
	'(+ x 23)'
	'(/ 3.141 x)'
	'(+ (^ x 2) (^ x 3))'
]
```

Symbolic expressions implement `Number`.
`squared` multiplies a number by itself:

```
>>> let x = 'x'.Symbol;
>>> (23 - x).squared
>>> .printString
'(* (- 23 x) (- 23 x))'
```

`Hypotenuse` is the `sqrt` of the sum of the squares:

```
>>> let x = 'x'.Symbol;
>>> let y = 'y'.Symbol;
>>> x.Hypotenuse(y).printString
'(sqrt (+ (* x x) (* y y)))'
```

The operator need not be a `Symbol`,
is may also be a `SymbolicExpression`:

```
>>> let x = 'x'.Symbol;
>>> let y = 'y'.Symbol;
>>> SymbolicExpression(
>>> 	SymbolicExpression(
>>> 		'f',
>>> 		[x]
>>> 	),
>>> 	[y]
>>> ).printString
'((f x) y)'
```

* * *

See also: asSymbolicExpression, name, printString, Symbol

Categories: Logic, Type
