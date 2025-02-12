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
>>> ('x'.Symbol + 23)
>>> .isSymbolicExpression
true
```

Symbols are cached on construction,
so that equal symbols compare identically:

```
>>> Symbol('x') == Symbol('x')
true

>>> system
>>> .cache
>>> .at('symbolDictionary')
>>> .at('x')
>>> .isSymbol
true
```

However `=` is defined symbolically:

```
>>> let x = Symbol('x');
>>> let e = x = x;
>>> (e.isSymbolicExpression, e.printString)
(true, '(= x x)')
```

The `printString` of a `Symbol` is its name:

```
>>> Symbol('x').printString
'x'

>>> Symbol('x').asString
'x'
```

* * *

See also: name, String, SymbolicExpression

Categories: Logic, Type
