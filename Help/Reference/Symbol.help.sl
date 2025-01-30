# Symbol

- _Symbol(aString)_

A `Type` representing a named symbol.

Symbols have a predicate and a name:

```
>>> let x = 'x'.Symbol;
>>> (x.isSymbol, x.name)
(true, 'x')
```

Symbols implement the `Number` trait,
answering `SymbolicExpression` values:

```
>>> 'x'.Symbol + 23
SymbolicExpression(
	'+',
	[
		'x'.Symbol,
		23
	]
)
```

* * *

See also: name, String, SymbolicExpression

Categories: Logic, Type
