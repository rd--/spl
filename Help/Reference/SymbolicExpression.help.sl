# SymbolicExpression

- _SymbolicExpression(operand, operators)_

A `Type` representing a symbolic expression.
The `printString` of a symbolic expression is an _S-expression_.

`SymbolicExpression` implements `=` symbolically:

```
>>> let e = 'x'.Symbol = 'y'.Symbol;
>>> (e.isSymbolicExpression, e.printString)
(true, '(= x y)')
```

`isEqualSymbolicExpression` tests if two `SymbolicExpression` values are the same:

```
>>> ('x'.Symbol + 3.141)
>>> .isEqualSymbolicExpression(
>>> 	('y'.Symbol * 1.618)
>>> )
false
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
>>> (23 - 'x'.Symbol).squared
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

* * *

See also: asSymbolicExpression, name, printString, Symbol

Categories: Logic, Type
