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

The set of mathematical lower case bold italic roman letters are symbol literals for the ordinary characters they represent:

```
>>> 𝒙.isSymbol
true

>>> 𝒙.name
'x'
```

Symbols implement the `Number` trait,
answering `SymbolicExpression` values:

```
>>> (𝒙 + 23).isSymbolicExpression
true
```

Symbols are cached on construction,
so that equal symbols compare identically:

```
>>> 𝒙 == 𝒙
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
>> 𝒙 = 𝒙
(= x x)
```

The `storeString` of a `Symbol` uses the constructor notation:

```
>> 𝒙.storeString
Symbol('x')
```

The `printString` of a `Symbol` is its name:

```
>>> Symbol('x').printString
'x'

>>> Symbol('x').asString
'x'

>> 𝒙.printString
x
```

* * *

See also: name, String, SymbolicExpression

Guides: String Syntax

Unicode: U+00060 Grave Accent

Categories: Logic, Type
