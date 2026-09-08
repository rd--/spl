# Symbol

- _Symbol(s)_

A `Type` representing a named symbol specified by the string _s_.

Symbols have a predicate and a name:

```
>>> let x = 'x'.Symbol;
>>> (x.isSymbol, x.name)
(true, 'x')
```

There is a literal notation for symbols:

```
>>> `x`.isSymbol
true
```

Symbols implement the `Number` trait,
answering `SymbolicExpression` values:

```
>>> (`x` + 23).isSymbolicExpression
true
```

Symbols are cached on construction,
so that equal symbols compare identically:

```
>>> `x` == `x`
true
```

The cache is stored at the `System` `symbolDictionary`:

```
>>> system
>>> .symbolDictionary
>>> .at('x')
>>> .isSymbol
true
```

However `=` is defined symbolically:

```
>> `x` = `x`
(= x x)
```

The `storeString` of a `Symbol` uses the constructor notation:

```
>> `x`.storeString
Symbol('x')
```

The `printString` of a `Symbol` is its name:

```
>>> Symbol('x').printString
'x'

>>> Symbol('x').asString
'x'

>> `x`.printString
x
```

* * *

See also: name, String, SymbolicExpression

Guides: String Syntax

Unicode: U+00060 Grave Accent

Categories: Logic, Type
